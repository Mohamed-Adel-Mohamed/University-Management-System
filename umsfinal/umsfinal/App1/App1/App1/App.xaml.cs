using Xamarin.Forms;

namespace ToDoApp
{
    public partial class App : Application
    {
        public App()
        {
            InitializeComponent();

            // Set the MainPage of the app
            MainPage = new MainPage();
        }

        protected override void OnStart()
        {
            // Handle when your app starts
        }

        protected override void OnSleep()
        {
            // Handle when your app sleeps
        }

        protected override void OnResume()
        {
            // Handle when your app resumes
        }
    }
}
