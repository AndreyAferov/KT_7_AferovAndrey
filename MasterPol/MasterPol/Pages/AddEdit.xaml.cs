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
                var list = Data.MasterPolEntities.GetContext().PartnetName.ToList();
                ComboPar.ItemsSource = list;


                if (FlagAddorEdit == "add")
                {
                    ComboPar.SelectedItem = null;
                    NameTextBox.Text = string.Empty;
                    RatingTextBox.Text = string.Empty;
                    AdressTextBox.Text = string.Empty;
                    FIOTextBox.Text = string.Empty;
                    PhoneTextBox.Text = string.Empty;
                    EmailTextBox.Text = string.Empty;
                }
                else if (FlagAddorEdit == "edit")
                {
                    NameTextBox.Text = _currentpartner.PartnetName.NamePartner.ToString();
                    RatingTextBox.Text = _currentpartner.Rate.ToString();
                    AdressTextBox.Text = _currentpartner.Adress.ToString();
                    FIOTextBox.Text = _currentpartner.DirectorName.NameDir.ToString();
                    PhoneTextBox.Text = _currentpartner.PhoneNumber.ToString();
                    EmailTextBox.Text = _currentpartner.Email.ToString();
                    ComboPar.SelectedItem = Data.MasterPolEntities.GetContext().PartnetName
                    .FirstOrDefault(d => d.Id == _currentpartner.Id);
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
                    errors.AppendLine("Выберите тип партнера");
                }
                if (string.IsNullOrEmpty(RatingTextBox.Text))
                {
                    errors.AppendLine("Заполните рейтинг");
                }

                if (string.IsNullOrEmpty(AdressTextBox.Text))
                {
                    errors.AppendLine("Заполните адрес");
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
                _currentpartner.Id = Data.MasterPolEntities.GetContext().PartnetName.Where(p => p.Id == selectedCategory.Id).FirstOrDefault().Id;
                _currentpartner.Rate = (RatingTextBox.Text);
                _currentpartner.PhoneNumber = PhoneTextBox.Text;
                _currentpartner.Email = EmailTextBox.Text;


                var searchDirector = (from item in Data.MasterPolEntities.GetContext().DirectorName
                                      where item.NameDir == FIOTextBox.Text
                                      select item).FirstOrDefault();
                if (searchDirector != null)
                {
                    _currentpartner.Id = searchDirector.id;
                }
                else
                {
                    Data.DirectorName directors = new Data.DirectorName()
                    {
                        NameDir = FIOTextBox.Text
                    };
                    Data.MasterPolEntities.GetContext().DirectorName.Add(directors);
                    Data.MasterPolEntities.GetContext().SaveChanges();
                    _currentpartner.Id = directors.id;
                }

                if (errors.Length > 0)
                {
                    MessageBox.Show(errors.ToString(), "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }


                var searchPartnerName = (from item in Data.MasterPolEntities.GetContext().PartnetName
                                         where item.NamePartner == NameTextBox.Text
                                         select item).FirstOrDefault();
                if (searchPartnerName != null)
                {
                    _currentpartner.Id = searchPartnerName.Id;
                }
                else
                {
                    Data.PartnetName partnerName = new Data.PartnetName()
                    {
                        NamePartner = NameTextBox.Text
                    };
                    Data.MasterPolEntities.GetContext().PartnetName.Add(partnerName);
                    Data.MasterPolEntities.GetContext().SaveChanges();
                    _currentpartner.Id = partnerName.Id;
                }



                if (FlagAddorEdit == "add")
                {
                    Data.MasterPolEntities.GetContext().Partner.Add(_currentpartner);
                    Data.MasterPolEntities.GetContext().SaveChanges();
                    MessageBox.Show("Успешно добавлено!", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
                }
                else if (FlagAddorEdit == "edit")
                {
                    Data.MasterPolEntities.GetContext().SaveChanges();
                    MessageBox.Show("Успешно изменено!", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
                    Manager.MainFrame.Navigate(new ViewPage());
                }
            }
            catch (Exception ex)
            {

            }
        }
    }
}
            
