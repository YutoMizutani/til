## Shellwords written in Swift

```swift
import Foundation

extension String {
    mutating func gsub(_ pattern: String, _ replacement: String = "") {
        do {
            let regex = try NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options.caseInsensitive)
            let range = NSMakeRange(0, count)
            self = regex.stringByReplacingMatches(in: self, options: [], range: range, withTemplate: replacement)
        } catch {
            return
        }
    }
}

/// Shellwords
///
/// Translated from ruby: [https://github.com/ruby/ruby/blob/ruby_2_6/lib/shellwords.rb](https://github.com/ruby/ruby/blob/ruby_2_6/lib/shellwords.rb)
///
/// [COPYING](https://github.com/ruby/ruby/blob/master/COPYING)
public struct Shellwords {
    private init() {}

    /// Escapes a string so that it can be safely used in a Bourne shell
    /// command line.  +str+ can be a non-string object that responds to
    /// +to_s+.
    ///
    /// Note that a resulted string should be used unquoted and is not
    /// intended for use in double quotes nor in single quotes.
    ///
    ///   argv = Shellwords.escape("It's better to give than to receive")
    ///   argv #=> "It\\'s\\ better\\ to\\ give\\ than\\ to\\ receive"
    ///
    /// String#shellescape is a shorthand for this function.
    ///
    ///   argv = "It's better to give than to receive".shellescape
    ///   argv #=> "It\\'s\\ better\\ to\\ give\\ than\\ to\\ receive"
    ///
    ///   /// Search files in lib for method definitions
    ///   pattern = "^[ \t]*def "
    ///   open("| grep -Ern #{pattern.shellescape} lib") { |grep|
    ///     grep.each_line { |line|
    ///       file, lineno, matched_line = line.split(':', 3)
    ///       /// ...
    ///     }
    ///   }
    ///
    /// It is the caller's responsibility to encode the string in the right
    /// encoding for the shell environment where this string is used.
    ///
    /// Multibyte characters are treated as multibyte characters, not as bytes.
    ///
    /// Returns an empty quoted String if +str+ has a length of zero.
    public static func shellEscape(_ str: String) -> String {
        // An empty argument will be skipped, so return empty quotes.
        guard !str.isEmpty else { return "''" }

        var str = str.description

        // Treat multibyte characters as is.  It is the caller's responsibility
        // to encode the string in the right encoding for the shell
        // environment.
        str.gsub(#"/([^A-Za-z0-9_\-.,:\/@\n])/"#, #"\\\\\\1"#)

        // A LF cannot be escaped with a backslash because a backslash + LF
        // combo is regarded as a line continuation and simply ignored.
        str.gsub(#"/\n/"#, #"'\n'"#)

        return str
    }

    public static func escape(_ str: String) -> String {
        return shellEscape(str)
    }
}
```
