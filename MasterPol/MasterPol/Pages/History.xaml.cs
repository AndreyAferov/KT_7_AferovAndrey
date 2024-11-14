using MasterPol.Data;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace MasterPol.Pages
{
    /// <summary>
    /// Логика взаимодействия для History.xaml
    /// </summary>
    public partial class History : Page
    {
        private readonly Data.Partner _selectedPartner;
        private Partner _partner;
        public History(Partner partner)
        {
            _partner = partner;
            InitializeComponent();
            LoadHistoryData();
        }
        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new ViewPage());
        }
        private void LoadHistoryData()
        {
            var historyData = from product in Data.MasterPolEntities.GetContext().PartnerProducts
                              join type in Data.MasterPolEntities.GetContext().TypeProduct
                              on product.Production equals type.Id
                              where product.PartnerName == _partner.Id
                              select new
                              {
                                  Productionn = type.Name,
                                  CountOfProduction = product.CountProduct,
                                  DateOfSale = product.DateSell
                              };

            HistoryDataGrid.ItemsSource = historyData.ToList();
        }
    }
}
