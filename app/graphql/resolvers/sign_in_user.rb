class Resolvers::SignInUser < GraphQL::Function
  argument :email, !Types::AuthProviderEmailInput

  type do
    name 'SigninPayload'

    field :token, types.String
    field :user, Types::UserType
  end

  def call(_obj, args, _ctx)
    input = args[:email]

    return unless input

    user = User.find_by email: input[:email]

    return unless user
    return unless user.authenticate(input[:password])

    crypt = ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base.byteslice(0..31))
    token = crypt.encrypt_and_sign("user-id:#{ user.id }")

    OpenStruct.new({
      user: user,
      token: token
    })
  end
end