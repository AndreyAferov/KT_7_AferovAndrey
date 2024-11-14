using MasterPol.Classes;
using MasterPol.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
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
    /// Логика взаимодействия для AddEdit.xaml
    /// </summary>
    public partial class AddEdit : Page
    {
        public string FlagAddorEdit = "default";
        public Data.Partner _currentpartner = new Data.Partner();
        public AddEdit(Data.Partner partner)
        {
            InitializeComponent();

            if (partner != null)
            {
                _currentpartner = partner;
                FlagAddorEdit = "edit";
            }
            else
            {
                FlagAddorEdit = "add";
            }
            DataContext = _currentpartner;

            Init();
        }

        public void Init()
        {
            try
            {
                IdTextBox.Visibility = Visibility.Hidden;
                IdLabel.Visibility = Visibility.Hidden;
                var list = Data.MasterPolEntities.GetContext().PartnetName.ToList();
                ComboPar.ItemsSource = list;


                if (FlagAddorEdit == "add")
                {
                    ComboPar.SelectedItem = null;
                    NameTextBox.Text = string.Empty;
                    RatingTextBox.Text = string.Empty;
                    FIOTextBox.Text = string.Empty;
                    PhoneTextBox.Text = string.Empty;
                    EmailTextBox.Text = string.Empty;
                }
                else if (FlagAddorEdit == "edit")
                {
                    NameTextBox.Text = _currentpartner.OrganizeName.NameOrg.ToString();
                    RatingTextBox.Text = _currentpartner.Rate.ToString();
                    RegionTextBox.Text = _currentpartner.Adress1.Regions1.NameRegion;
                    CityTextBox.Text = _currentpartner.Adress1.Countrys.NameCountry.ToString();
                    StreetTextBox.Text = _currentpartner.Adress1.Strets.NameStreet.ToString();
                    HouseNumTextBox.Text = _currentpartner.Adress1.HouseNum.ToString();
                    IndexTextBox.Text = _currentpartner.Adress1.CountryIndex.NameCountry.ToString();
                    FIOTextBox.Text = _currentpartner.DirectorName.NameDir;
                    PhoneTextBox.Text = _currentpartner.PhoneNumber;
                    EmailTextBox.Text = _currentpartner.Email;
                    IdTextBox.Text = _currentpartner.Id.ToString();
                    ComboPar.SelectedItem = Data.MasterPolEntities.GetContext().PartnetName
                        .FirstOrDefault(d => d.Id == _currentpartner.Partner1);
                }
            }
            catch { }
        }
        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new ViewPage());
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                StringBuilder errors = new StringBuilder();
                if (string.IsNullOrEmpty(NameTextBox.Text))
                {
                    errors.AppendLine("Заполните наименование");
                }
                if (ComboPar.SelectedItem == null)
                {
                    errors.AppendLine("Выберите партнера");
                }
                if (string.IsNullOrEmpty(RatingTextBox.Text))
                {
                    errors.AppendLine("Заполните рейтинг");
                }
                if (string.IsNullOrEmpty(RegionTextBox.Text))
                {
                    errors.AppendLine("Заполните Регион");
                }
                if (string.IsNullOrEmpty(CityTextBox.Text))
                {
                    errors.AppendLine("Заполните Город");
                }
                if (string.IsNullOrEmpty(StreetTextBox.Text))
                {
                    errors.AppendLine("Заполните Улицу");
                }
                if (string.IsNullOrEmpty(HouseNumTextBox.Text))
                {
                    errors.AppendLine("Заполните номер дома");
                }
                if (string.IsNullOrEmpty(IndexTextBox.Text))
                {
                    errors.AppendLine("Заполните индекс");
                }
                if (string.IsNullOrEmpty(FIOTextBox.Text))
                {
                    errors.AppendLine("Заполните ФИО");
                }
                if (string.IsNullOrEmpty(PhoneTextBox.Text))
                {
                    errors.AppendLine("Заполните номер телефона");
                }
                if (string.IsNullOrEmpty(EmailTextBox.Text))
                {
                    errors.AppendLine("Заполните Email");
                }

                if (errors.Length > 0)
                {
                    MessageBox.Show(errors.ToString(), "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }

                var selectedCategory = ComboPar.SelectedItem as Data.PartnetName;
                if (selectedCategory == null)
                {
                    MessageBox.Show("Выберите партнера", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }

                _currentpartner.Partner1 = selectedCategory.Id;
                _currentpartner.Rate = RatingTextBox.Text;
                _currentpartner.PhoneNumber = PhoneTextBox.Text;
                _currentpartner.Email = EmailTextBox.Text;

                var searchDirector = (from item in Data.MasterPolEntities.GetContext().DirectorName
                                      where item.NameDir == FIOTextBox.Text
                                      select item).FirstOrDefault();
                if (searchDirector != null)
                {
                    _currentpartner.Director = searchDirector.id;
                }
                else
                {
                    Data.DirectorName directors = new Data.DirectorName()
                    {
                        NameDir = FIOTextBox.Text
                    };
                    Data.MasterPolEntities.GetContext().DirectorName.Add(directors);
                    Data.MasterPolEntities.GetContext().SaveChanges();
                    _currentpartner.Director = directors.id;
                }

                var searchPartnerName = Data.MasterPolEntities.GetContext().OrganizeName
                                        .FirstOrDefault(item => item.NameOrg == NameTextBox.Text);

                if (searchPartnerName != null)
                {
                    _currentpartner.Name = searchPartnerName.Id;
                }
                else
                {
                    var partnerName = new Data.OrganizeName
                    {
                        NameOrg = NameTextBox.Text
                    };

                    Data.MasterPolEntities.GetContext().OrganizeName.Add(partnerName);
                    Data.MasterPolEntities.GetContext().SaveChanges(); 

                    _currentpartner.Name = partnerName.Id; 
                }


                int houseNum = int.Parse(HouseNumTextBox.Text);

                var address = MasterPolEntities.GetContext().Adress
                    .FirstOrDefault(a => a.Regions.NameRegion == RegionTextBox.Text &&
                                         a.Countrys.NameCountry == CityTextBox.Text &&
                                         a.Strets.NameStreet == StreetTextBox.Text &&
                                         a.HouseNum == houseNum &&
                                         a.CountryIndex.NameCountry == IndexTextBox.Text);

                if (address == null)
                {
                    address = new Adress
                    {
                        Regions = new Regions { NameRegion = RegionTextBox.Text },
                        Countrys = new Countrys { NameCountry = CityTextBox.Text },
                        Strets = new Strets { NameStreet = StreetTextBox.Text },
                        HouseNum = houseNum,
                        CountryIndex = new CountryIndex { NameCountry = IndexTextBox.Text }
                    };

                    MasterPolEntities.GetContext().Adress.Add(address);
                    MasterPolEntities.GetContext().SaveChanges();
                }

                _currentpartner.Adress1 = address;


                if (address.Id != 0)
                {
                    _currentpartner.Adress1 = address;
                }
                else
                {
                    MessageBox.Show("Ошибка сохранения адреса.", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }
                if (FlagAddorEdit == "add")
                {
                    Data.MasterPolEntities.GetContext().Partner.Add(_currentpartner);
                    MessageBox.Show("Успешно добавлено", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
                    Manager.MainFrame.Navigate(new ViewPage());
                }
                else if (FlagAddorEdit == "edit")
                {
                    MessageBox.Show("Успешно сохранено", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
                    Manager.MainFrame.Navigate(new ViewPage());
                }

                Data.MasterPolEntities.GetContext().SaveChanges();

            }
            catch (Exception)
            {
            }
        }
    }
}
            
