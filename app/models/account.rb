class Account < ActiveRecord::Base
  def self.get_saml_settings
    # this is just for testing purposes.
    # should retrieve SAML-settings based on subdomain, IP-address, NameID or similar
    settings = OneLogin::RubySaml::Settings.new

    # Example settings data, replace this values!
    settings.assertion_consumer_service_url = "#{ENV['HOST_URL']}/saml/acs"
    settings.assertion_consumer_logout_service_url = "#{ENV['HOST_URL']}/saml/logout"
    settings.issuer                         = "#{ENV['HOST_URL']}/saml/metadata"
    settings.idp_entity_id                  = ENV['IDP_ENTITY_ID']
    settings.idp_sso_target_url             = ENV['IDP_SSO_TARGET_URL']
    settings.idp_slo_target_url             = ENV['IDP_SLO_TARGET_URL']
    settings.idp_cert                       = ENV['IDP_CERT'] if ENV['IDP_CERT'].present?
    settings.idp_cert_fingerprint           = ENV['IDP_CERT_FINGERPRINT'] if ENV['IDP_CERT_FINGERPRINT'].present?
    settings.name_identifier_format         = "urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress"
    settings
  end
end
