// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {

  public enum AddNote {
    /// Save Note
    public static let save = L10n.tr("Localizable", "AddNote.save")
  }

  public enum Confirm {
    /// Login
    public static let button = L10n.tr("Localizable", "Confirm.button")
    /// An email has been sent to %@ with further instructions.
    public static func description(_ p1: Any) -> String {
      return L10n.tr("Localizable", "Confirm.description", String(describing: p1))
    }
    /// Password Reset Confirmation
    public static let title = L10n.tr("Localizable", "Confirm.title")
  }

  public enum Forgot {
    /// Reset Password
    public static let button = L10n.tr("Localizable", "Forgot.button")
    /// Confirm your email and we’ll send the instructions
    public static let description = L10n.tr("Localizable", "Forgot.description")
    /// E-mail address
    public static let email = L10n.tr("Localizable", "Forgot.email")
    /// Please enter a valid email address.
    public static let failed = L10n.tr("Localizable", "Forgot.failed")
    /// Success
    public static let succes = L10n.tr("Localizable", "Forgot.succes")
    /// Forgot Password?
    public static let title = L10n.tr("Localizable", "Forgot.title")
  }

  public enum Login {
    /// Login or sign up to continue using our app.
    public static let description = L10n.tr("Localizable", "Login.description")
    /// Your email address and password cannot be empty.
    public static let emailandpasswordError = L10n.tr("Localizable", "Login.emailandpasswordError")
    /// Your email address cannot be empty.
    public static let emailError = L10n.tr("Localizable", "Login.emailError")
    /// The email and password you entered did not match our records. Please try again.
    public static let failed = L10n.tr("Localizable", "Login.failed")
    /// New User?
    public static let footerLeft = L10n.tr("Localizable", "Login.footerLeft")
    ///  Sign up now
    public static let footerRight = L10n.tr("Localizable", "Login.footerRight")
    /// Forgot Password?
    public static let forgot = L10n.tr("Localizable", "Login.forgot")
    /// Your password cannot be empty
    public static let passwordError = L10n.tr("Localizable", "Login.passwordError")
    /// E-mail adress
    public static let placeholderMail = L10n.tr("Localizable", "Login.placeholderMail")
    /// Password
    public static let placeholderPass = L10n.tr("Localizable", "Login.placeholderPass")
    /// Succes Login
    public static let succes = L10n.tr("Localizable", "Login.succes")
    /// Login
    public static let title = L10n.tr("Localizable", "Login.title")
  }

  public enum NoteList {
    /// Add Note
    public static let button = L10n.tr("Localizable", "NoteList.button")
    /// Cancel
    public static let deletefirstButton = L10n.tr("Localizable", "NoteList.deletefirstButton")
    /// Are you sure you want to delete this note
    public static let deleteMessage1 = L10n.tr("Localizable", "NoteList.deleteMessage1")
    /// Delete
    public static let deletesecondButton = L10n.tr("Localizable", "NoteList.deletesecondButton")
    /// Delete Note
    public static let deleteTitle1 = L10n.tr("Localizable", "NoteList.deleteTitle1")
  }

  public enum Register {
    /// Already have an account? 
    public static let already = L10n.tr("Localizable", "Register.already")
    /// Login or sign up to continue using our app.
    public static let description = L10n.tr("Localizable", "Register.description")
    /// E-mail address
    public static let email = L10n.tr("Localizable", "Register.email")
    /// Please be sure to fill in all fields.
    public static let emailPasswordUsernameError = L10n.tr("Localizable", "Register.email_password_usernameError")
    /// Your email address cannot be empty
    public static let emailError = L10n.tr("Localizable", "Register.emailError")
    /// Failed Sign Up
    public static let failed = L10n.tr("Localizable", "Register.failed")
    /// Forgot Password?
    public static let forgot = L10n.tr("Localizable", "Register.forgot")
    /// Full Name
    public static let fullName = L10n.tr("Localizable", "Register.fullName")
    /// Password
    public static let password = L10n.tr("Localizable", "Register.password")
    /// Your password cannot be empty
    public static let passwordError = L10n.tr("Localizable", "Register.passwordError")
    /// Sign in now
    public static let signIn = L10n.tr("Localizable", "Register.signIn")
    /// Succes Sign Up
    public static let succes = L10n.tr("Localizable", "Register.succes")
    /// Sign Up
    public static let title = L10n.tr("Localizable", "Register.title")
    /// Your username cannot be empty
    public static let usernameError = L10n.tr("Localizable", "Register.usernameError")
  }

  public enum Validation {
    /// Please enter a valid email address.
    public static let email = L10n.tr("Localizable", "Validation.email")
    /// Your password must be at least 6 characters.
    public static let password = L10n.tr("Localizable", "Validation.password")
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
