defmodule ElBasicTest do
  use ExUnit.Case, async: true
  doctest ElBasic

  describe "ElBasic.parse_line/1" do
    test "returns nil when not a token" do
      assert ElBasic.parse_line("12") == {:skip, line: "12"}
      assert ElBasic.parse_line("    ") == {:skip, line: "    "}
    end

    test "returns line when it contains valid token" do
      assert ElBasic.parse_line("VAR I") == {:print, line: "VAR I", token: "VAR"}
      assert ElBasic.parse_line("FOR I=1 TO 31") == {:print, line: "FOR I=1 TO 31", token: "FOR"}
      assert ElBasic.parse_line("IF") == {:print, line: "IF", token: "IF"}
      assert ElBasic.parse_line("PRINT") == {:print, line: "PRINT", token: "PRINT"}
      assert ElBasic.parse_line("NEXT") == {:print, line: "NEXT", token: "NEXT"}
      assert ElBasic.parse_line("ENDIF") == {:print, line: "ENDIF", token: "ENDIF"}
    end
  end

  describe "ElBasic.parse_file/1" do
    test "prints all correct lines and skips incorrect" do
      input = """
      12
      \s\s\s\s
      VAR I
      """
      output = """
      VAR I
      """
      assert ElBasic.parse_file(input) == output
    end

    test "indents lines when nesting" do
      input = """
      IF !(I MOD 3) THEN
      PRINT "FIZZ"
      ENDIF
      """
      output = """
      IF !(I MOD 3) THEN
          PRINT "FIZZ"
      ENDIF
      """
      assert ElBasic.parse_file(input) == output

      input2 = """
      FOR I=1 TO 31
      PRINT "FIZZ"
      NEXT
      """
      output2 = """
      FOR I=1 TO 31
          PRINT "FIZZ"
      NEXT
      """
      assert ElBasic.parse_file(input2) == output2
    end

    test "works" do
      input = """
      12
      \s\s\s\s
      VAR I
      \sFOR I=1 TO 31
      \t\t\t\tIF !(I MOD 3) THEN
      \s\sPRINT "FIZZ"
      \s\s\t\tENDIF
      \t\t\t\t\s\s\s\sIF !(I MOD 5) THEN
      \t\t\t\t\s\sPRINT "BUZZ"
      \s\s\t\t\t\t\t\tENDIF
      \t\t\t\tIF (I MOD 3) && (I MOD 5) THEN
      \s\s\s\s\s\sPRINT "FIZZBUZZ"
      \s\s\t\tENDIF
      \t\t\t\t\sNEXT
      """
      output = """
      VAR I
      FOR I=1 TO 31
          IF !(I MOD 3) THEN
              PRINT "FIZZ"
          ENDIF
          IF !(I MOD 5) THEN
              PRINT "BUZZ"
          ENDIF
          IF (I MOD 3) && (I MOD 5) THEN
              PRINT "FIZZBUZZ"
          ENDIF
      NEXT
      """
      assert ElBasic.parse_file(input) == output
    end
  end
end
