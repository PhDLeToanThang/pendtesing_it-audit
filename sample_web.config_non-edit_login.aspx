# Q.1 How can I not modify login.aspx .net framework C# 
# just configure Web.config of Web IIS declare iDP, SP and OpenID protocol related parameters with ADFS 2019 to help SSO?
#########################################################
# A1. If you want to use OpenID Connect protocol with ADFS 2019 and avoid modifying your login.aspx page, 
# you can try to configure your web.config file with the following settings 
# https://learn.microsoft.com/en-us/windows-server/identity/ad-fs/development/ad-fs-openid-connect-oauth-concepts
# https://stackoverflow.com/questions/54541133/how-to-implement-single-sign-on-adfs-in-asp-net-mvc
# http://neilmorrissey.net/deploying-a-web-app-on-iis-and-integrating-with-adfs:
#
#########################################################

<appSettings>
<!-- The realm to use for the application -->
<add key="ida:Wtrealm" value="https://myWebServer/myWebApplication" />
<!-- The ADFS metadata address -->
<add key="ida:ADFSMetadata" value="https://adfs.company.vn/FederationMetadata/2007-06/FederationMetadata.xml" />
</appSettings>

<system.web>
<authentication mode="None" />
</system.web>

<system.identityModel>
<identityConfiguration>
<audienceUris>
<add value="https://myWebServer/myWebApplication" />
</audienceUris>
<securityTokenHandlers>
<add type="System.IdentityModel.Tokens.JwtSecurityTokenHandler, System.IdentityModel.Tokens.Jwt" />
<securityTokenHandlerConfiguration>
<certificateValidation certificateValidationMode="None" />
</securityTokenHandlerConfiguration>
</securityTokenHandlers>
<issuerNameRegistry type="System.IdentityModel.Tokens.ValidatingIssuerNameRegistry, System.IdentityModel.Tokens.ValidatingIssuerNameRegistry">
<authority name="http://adfs.company.vn/adfs/services/trust">
<keys>
<!-- Add the thumbprint of the ADFS signing certificate here -->
<add thumbprint="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" />
</keys>
<validIssuers>
<!-- Add the issuer name of the ADFS server here -->
<add name="http://adfs.company.vn/adfs/services/trust" />
</validIssuers>
</authority>
</issuerNameRegistry>
</identityConfiguration>
</system.identityModel>

<system.webServer>
<modules runAllManagedModulesForAllRequests="true">
<!-- Add this module to handle OpenID Connect authentication -->
<add name="OpenIdConnectAuthenticationModule" type="Microsoft.IdentityModel.Web.OpenIdConnectAuthenticationModule, Microsoft.IdentityModel.Web" />
</modules>
</system.webServer>

<location path="FederationMetadata">
<system.webServer>
<!-- Disable authentication for the federation metadata endpoint -->
<security>
<authentication>
<anonymousAuthentication enabled="true" />
<windowsAuthentication enabled="false" />
</authentication>
</security>
</system.webServer>
</location>
