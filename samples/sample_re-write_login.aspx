# Q4. How to re-write login.aspx .net framework C# when integrating ADFS for Login SSO and old code have connect Oracle db local users ?
##################################################
# A4. It seems that you want to integrate ADFS SSO into your existing .NET web application that uses Oracle db for local users. 
# There are different ways to achieve this, but one possible option is to use WsFederationAuthenticationOptions in your 
# Startup class to configure the authentication middleware 
# https://stackoverflow.com/questions/60959888/integrating-adfs-sso-into-existing-net-web-application. 
# You also need to add some code to your login.aspx page to check if the user is authenticated and challenge them 
# if not https://stackoverflow.com/questions/60959888/integrating-adfs-sso-into-existing-net-web-application. 
# You can also use the trust/13/UsernameMixed endpoint of the ADFS 2.0 to authenticate the user by username and password 
# https://stackoverflow.com/questions/10651304/authenticate-user-by-adfs-active-directory-federation-service. 
# Here is an example of how you can do this:
##################################################
// Startup.cs
public class Startup
{
public void Configuration(IAppBuilder app)
{
ConfigureAuth(app);
}

private static string realm = ConfigurationManager.AppSettings["ida:Wtrealm"];
private static string adfsMetadata = ConfigurationManager.AppSettings["ida:ADFSMetadata"];

public void ConfigureAuth(IAppBuilder app)
{
app.SetDefaultSignInAsAuthenticationType(CookieAuthenticationDefaults.AuthenticationType);

app.UseCookieAuthentication(new CookieAuthenticationOptions());

app.UseWsFederationAuthentication(
new WsFederationAuthenticationOptions
{
Wtrealm = realm,
MetadataAddress = adfsMetadata
});
}
}

// login.aspx.cs
protected void Page_Load(object sender, EventArgs e)
{
if (!System.Web.HttpContext.Current.Request.IsAuthenticated)
{
System.Web.HttpContext.Current.GetOwinContext().Authentication.Challenge(
new AuthenticationProperties { RedirectUri = "/" },
WsFederationAuthenticationDefaults.AuthenticationType);
}
}

// ADFS authentication method
public SecurityToken GetToken(string username, string password)
{
WSTrustChannelFactory adfsfactory = new WSTrustChannelFactory(
new UserNameWSTrustBinding(SecurityMode.TransportWithMessageCredential),
"https://adfs.company.vn/adfs/services/trust/13/usernamemixed");
adfsfactory.TrustVersion = TrustVersion.WSTrust13;
adfsfactory.Credentials.UserName.UserName = username;
adfsfactory.Credentials.UserName.Password = password;

var rst = new RequestSecurityToken
{
RequestType = RequestTypes.Issue,
AppliesTo = new EndpointReference(realm),
KeyType = KeyTypes.Bearer,
};

IWSTrustChannelContract channel = adfsfactory.CreateChannel();
return channel.Issue(rst);
}
