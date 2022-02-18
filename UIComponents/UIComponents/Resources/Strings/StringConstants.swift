// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {

  public enum Login {
    /// Login or sign up to continue using our app.
    public static let description = L10n.tr("Localizable", "Login.description")
    /// New User?
    public static let footerLeft = L10n.tr("Localizable", "Login.footerLeft")
    ///  Sign up now
    public static let footerRight = L10n.tr("Localizable", "Login.footerRight")
    /// Forgot Password?
    public static let forgot = L10n.tr("Localizable", "Login.forgot")
    /// E-mail adress
    public static let placeholderMail = L10n.tr("Localizable", "Login.placeholderMail")
    /// Password
    public static let placeholderPass = L10n.tr("Localizable", "Login.placeholderPass")
    /// Login
    public static let title = L10n.tr("Localizable", "Login.title")
  }

  public enum Register {
    /// Already have an account? 
    public static let already = L10n.tr("Localizable", "Register.already")
    /// Login or sign up to continue using our app.
    public static let description = L10n.tr("Localizable", "Register.description")
    /// E-mail address
    public static let email = L10n.tr("Localizable", "Register.email")
    /// Forgot Password?
    public static let forgot = L10n.tr("Localizable", "Register.forgot")
    /// Full Name
    public static let fullName = L10n.tr("Localizable", "Register.fullName")
    /// Password
    public static let password = L10n.tr("Localizable", "Register.password")
    /// Sign in now
    public static let signIn = L10n.tr("Localizable", "Register.signIn")
    /// Sign Up
    public static let title = L10n.tr("Localizable", "Register.title")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
