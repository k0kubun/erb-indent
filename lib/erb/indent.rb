require 'erb'

module Erb
  class Indent < ERB
    VERSION = '0.0.1'

    class IndentScanner < ERB::Compiler::TrimScanner
      def stags
        ['<%\|', *super]
      end
    end

    class IndentCompiler < ERB::Compiler
      def initialize(*)
        super
        @indent_level = nil
      end

      def add_put_cmd(out, content)
        if @indent_level
          super(out, content.sub(/^ +/, ' ' * @indent_level))
        else
          super
        end
      end

      def add_insert_cmd(out, content)
        if @indent_level
          super(out, "(#{content}).to_s.sub(/^ +/, ' ' * #{@indent_level})")
        else
          super
        end
      end

      def compile_stag(stag, out, scanner)
        case stag
        when '<%|'
          if @indent_level
            @indent_level = nil
          else
            spaces = content.lines.last&.match(/\A +/)&.to_s
            @indent_level = spaces ? spaces.length : 0
          end
          super('<%', out, scanner)
        else
          super
        end
      end

      def make_scanner(src)
        IndentScanner.new(src, @trim_mode, @percent)
      end
    end

    def make_compiler(trim_mode)
      IndentCompiler.new(trim_mode)
    end
  end
end
