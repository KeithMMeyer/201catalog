using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(GameSource.Startup))]
namespace GameSource
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
