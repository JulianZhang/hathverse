insert into problem values (1, 'Hello World', 'Write a function `hello` that print out "Hello world!".', E'{-# LANGUAGE NoImplicitPrelude #-}\nmodule Hello where\nimport Test.IOSpec (IOSpec, Teletype, putStrLn)\ntype IO a = IOSpec Teletype a\n\nhello :: IO ()\nhello = putStrLn "Hello world!"\n', 'Hello', E'import Test.Hspec\nimport Test.IOSpec\nimport Hello (hello)\n\ngetOutput :: Effect () -> String\ngetOutput (Done _) = ""\ngetOutput (Print c eff) = c : getOutput eff\ngetOutput _ = " ERROR"\n\nmain :: IO ()\nmain = hspec $\n  describe "hello" $\n    it "prints out \\"Hello world!\\" correctly" $\n      getOutput (evalIOSpec hello singleThreaded) `shouldBe` "Hello world!\\n"\n');
