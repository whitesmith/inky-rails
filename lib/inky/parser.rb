module Inky
  class Parser

    # Create new parser
    #
    # @param input [String] The string to transform in html
    def initialize input
      file = File.open(in_tmp_file, 'w')
      file.write(input)
      file.close
    end

    # Render inky template
    #
    # @return [String]
    def render
      result = run
      remove_tmp_files
      result
    rescue => error
      ""
    end

    # Exec inky command
    #
    # @return [String] The result as string
    def run
      # TODO: Refactor this
      command = "#{inky_bin} #{in_tmp_file} #{out_tmp_file}"
      `#{command}`
      path = "#{out_tmp_file}/#{in_tmp_file.split('/')[2].split('.')[0]}.html"
      `mv #{out_tmp_file}/#{in_tmp_file.split('/')[2]} #{path}`
      `juice --web-resources-scripts=true #{path} #{inliner_out_tmp_file}`
      file = File.open(inliner_out_tmp_file, 'r')
      str  = file.read
      file.close
      str
    end

    private

      # Remove tmp files
      #
      # @return nil
      def remove_tmp_files
        FileUtils.rm(in_tmp_file)
        FileUtils.rmdir(out_tmp_file)
        nil
      end

      # Return tmp dir
      #
      # @return [String]
      def tmp_dir
        '/tmp'
      end

      # Get parser tpm file to store result
      #
      # @return [String]
      def out_tmp_file

        @_out_tmp_file ||= "#{tmp_dir}/out_#{(0...8).map { (65 + rand(26)).chr }.join}.html"
      end

      def inliner_out_tmp_file
        @_inliner_out_tmp_file ||= "#{tmp_dir}/out_inliner_#{(0...8).map { (65 + rand(26)).chr }.join}"
      end

      # Get parser tpm file to get result
      #
      # @return [String]
      def in_tmp_file

        @_in_tmp_file ||= "#{tmp_dir}/in_#{(0...8).map { (65 + rand(26)).chr }.join}.inky"
        # puts @_in_tmp_file
        return @_in_tmp_file
      end

      # Get inky-cli bin path
      #
      # @return [String]
      def inky_bin
        Inky::BIN
      end
  end
end
