# Q6. How to rewrite Logout.aspx .net framework c# when integrating ADFS for SSO login and 
# legacy code connecting Oracle DB local users?
################################################################
# A6. If you want to rewrite your Logout.aspx page to integrate ADFS for SSO login, 
# you can try to use the FederatedAuthentication.WSFederationAuthenticationModule class to sign out the user and 
# redirect them to the ADFS sign out page https://stackoverflow.com/questions/57722101/logout-from-adfs-using-c-sharp. 
# You also need to configure your web.config file with the appropriate settings for the ADFS server and the relying party 
# https://stackoverflow.com/questions/14309090/c-sharp-asp-net-single-sign-on-implementation. 
# Here is an example of how you can do this:
#################################################################

// Logout.aspx.cs
public void LogOut()
{
var module = FederatedAuthentication.WSFederationAuthenticationModule;
module.SignOut(false);
var request = new SignOutRequestMessage(new Uri(module.Issuer), module.Realm);
Response.Redirect(request.WriteQueryString());
}

// web.config
<appSettings>
<!-- The realm to use for the application -->
<add key="ida:Wtrealm" value="https://myWebServer/myWebApplication" />
<!-- The ADFS metadata address -->
<add key="ida:ADFSMetadata" value="https://adfs2019.cloud.edu.vn/FederationMetadata/2007-06/FederationMetadata.xml" />
</appSettings>

<system.web>
<authentication mode="None" />
</system.web>

<system.identityModel.services>
<federationConfiguration>
<cookieHandler requireSsl="true" />
<wsFederation passiveRedirectEnabled="true" issuer="https://adfs2019.cloud.edu.vn/adfs/ls/" realm="https://myWebServer/myWebApplication" requireHttps="true" />
</federationConfiguration>
</system.identityModel.services>

<system.webServer>
<modules runAllManagedModulesForAllRequests="true">
<!-- Add this module to handle WS-Federation authentication -->
<add name="WSFederationAuthenticationModule" type="System.IdentityModel.Services.WSFederationAuthenticationModule, System.IdentityModel.Services, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089" preCondition="managedHandler" />
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
