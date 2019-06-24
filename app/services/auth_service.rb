class AuthService
    def self.crypter
        ActiveSupport::MessageEncryptor.new(Settings.rails.secret_key_base.byteslice(0..31))
    end
end