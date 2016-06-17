require 'test_helper'

class Notifier < ActionMailer::Base
  self.view_paths = File.expand_path('../views', __FILE__)

  layout false

  def contact(recipient, format_type)
    @recipient = recipient
    mail(to: @recipient, from: 'john.doe@example.com') do |format|
      format.send(format_type)
    end
  end

  def link(format_type)
    mail(to: 'foo@bar.com', from: 'john.doe@example.com') do |format|
      format.send(format_type)
    end
  end

  def user(format_type)
    mail(to: 'foo@bar.com', from: 'john.doe@example.com') do |format|
      format.send(format_type)
    end
  end

  def no_partial(format_type)
    mail(to: 'foo@bar.com', from: 'john.doe@example.com') do |format|
      format.send(format_type)
    end
  end

  def multiple_format_contact(recipient)
    @recipient = recipient
    mail(to: @recipient, from: 'john.doe@example.com', template: 'contact') do |format|
      format.text  { render 'contact' }
      format.html  { render 'contact' }
    end
  end
end

class InkyTest < ActiveSupport::TestCase
  test 'html should be sent as html' do
    email = Notifier.contact('you@example.com', :inky)
    assert_equal 'text/html', email.mime_type
    assert_no_match(/<row>/, email.body.encoded.strip)
    assert_no_match(/<columns>/, email.body.encoded.strip)
    assert_match(/<table/, email.body.encoded.strip)
    assert_match(/This is a number: \d\.\d/, email.body.encoded.strip)
  end

  test 'with partial' do
    email = Notifier.user(:inky)
    assert_equal 'text/html', email.mime_type
    assert_match(/Hello Partial/, email.body.encoded.strip)
  end

  test 'without a partial' do
    email = Notifier.no_partial(:inky)
    assert_equal 'text/html', email.mime_type
    assert_match(/Hello World/, email.body.encoded.strip)
  end
end
