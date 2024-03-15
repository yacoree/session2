using Import.ADO;
using Import.Windows;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
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
using Import.ADO;
using Import.Data;

namespace Import
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        List<Products> products = new List<Products>();
        List<Products> newProductList = new List<Products>();
        List<Products> sortedProductList = new List<Products>();
        bool pressed = false;
        int page = 1;
        int maxPages = 1;
        public MainWindow()
        {
            InitializeComponent();
            foreach (Products product in DBConnection.connection.Products.ToList())
            {
                products.Add(product);
            }
            foreach (Products product in products.OrderBy(x => x.Product_ID))
            {
                sortedProductList.Add(product);
            };
            if (DBConnection.connection.Products.ToList().Count > 20)
            {
                CalcMaxPages(DBConnection.connection.Products.ToList());
            }
            Product_ListView.Items.SortDescriptions.Add(new SortDescription("ProductID", ListSortDirection.Ascending));
            Filter_CB.SelectionChanged += ComboBox_SelectionChanged;
            TypeFilter_CB.SelectionChanged += TypeFilter_CB_SelectionChanged;
            PageNumber_TB.TextChanged += PageNumber_TB_TextChanged;
            LoadListViewPage();
        }
        public void CalcMaxPages(List<Products> array)
        {
            maxPages = array.Count / 20;
            if (array.Count % 20 != 0) { maxPages++; }
        }

        private void ComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            SortListView();
        }

        private void Search_TB_TextChanged(object sender, TextChangedEventArgs e)
        {
            FilterUpdate();
        }
        public void FilterUpdate()
        {
            newProductList.Clear();
            string parameter = Search_TB.Text.ToLower();
            foreach (Products product in products)
            {
                if (product.Product_Type_ID != TypeFilter_CB.SelectedIndex && TypeFilter_CB.SelectedIndex != 0)
                {
                    continue;
                }
                if (product.Name.ToLower().Contains(parameter)) { newProductList.Add(product); }
            }
            if (Search_TB.Text == string.Empty && TypeFilter_CB.SelectedIndex == 0)
            {
                newProductList.Clear();
            }
            SortListView();
            CalcMaxPages(newProductList);
            LoadListViewPage();
        }

        private void PageNumber_TB_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (PageNumber_TB.Text == string.Empty) { return; }
            if (int.Parse(PageNumber_TB.Text) > 0) { page = int.Parse(PageNumber_TB.Text); }
            if (int.Parse(PageNumber_TB.Text) > maxPages)
            {
                PageNumber_TB.Text = maxPages.ToString();
                page = int.Parse(PageNumber_TB.Text);
            }
            LoadListViewPage();
        }

        public void SortListView()
        {
            sortedProductList.Clear();
            if (Search_TB.Text == string.Empty && TypeFilter_CB.SelectedIndex == 0)
            {
                newProductList.Clear();
                foreach (Products product in products)
                {
                    newProductList.Add(product);
                }
            }
            switch ((Filter_CB.SelectedItem as ComboBoxItem).Content.ToString())
            {
                case "ProductID":
                    foreach (Products product in newProductList.OrderBy(x => x.Product_ID)) { sortedProductList.Add(product); };
                    break;
                case "Name":
                    foreach (Products product in newProductList.OrderBy(x => x.Name)) { sortedProductList.Add(product); };
                    break;
                case "ProductType":
                    foreach (Products product in newProductList.OrderBy(x => x.Product_Type_ID)) { sortedProductList.Add(product); };
                    break;
                case "Article":
                    foreach (Products product in newProductList.OrderBy(x => x.Article)) { sortedProductList.Add(product); };
                    break;
                case "PeopleAmount":
                    foreach (Products product in newProductList.OrderBy(x => x.People_Amount)) { sortedProductList.Add(product); };
                    break;
                case "WorkshopNumber":
                    foreach (Products product in newProductList.OrderBy(x => x.Workshop_Number)) { sortedProductList.Add(product); };
                    break;
                case "MinAgentPrice":
                    foreach (Products product in newProductList.OrderBy(x => x.Min_Agent_Price)) { sortedProductList.Add(product); };
                    break;
                default: break;
            }
            if ((bool)SortDirection_CB.IsChecked)
            {
                Product_ListView.Items.SortDescriptions[0] = new SortDescription((Filter_CB.SelectedItem as ComboBoxItem).Content.ToString(), ListSortDirection.Ascending);
            }
            else
            {
                Product_ListView.Items.SortDescriptions[0] = new SortDescription((Filter_CB.SelectedItem as ComboBoxItem).Content.ToString(), ListSortDirection.Descending);
                sortedProductList.Reverse();
            }
            page = 1;
            PageNumber_TB.Text = page.ToString();
            CalcMaxPages(newProductList);
            LoadListViewPage();
        }

        private void SortDirection_CB_Click(object sender, RoutedEventArgs e)
        {
            SortListView();
        }

        private void PreviousPage_BTN_Click(object sender, RoutedEventArgs e)
        {
            if (page > 1)
            {
                page--;
                PageNumber_TB.Text = page.ToString();
            }
            LoadListViewPage();
        }

        public void LoadListViewPage()
        {
            int startItem = page * 20 - 20;
            Product_ListView.Items.Clear();
            if (sortedProductList.Count <= 0) { return; }
            if (page == maxPages)
            {
                for (int i = startItem; i < sortedProductList.Count; i++)
                {
                    Product_ListView.Items.Add(sortedProductList[i]);
                }
            }
            else
            {
                for (int i = startItem; i < startItem + 20; i++)
                {
                    Product_ListView.Items.Add(sortedProductList[i]);
                }
            }
        }

        private void NextPage_BTN_Click(object sender, RoutedEventArgs e)
        {
            if (page < maxPages)
            {
                page++;
                PageNumber_TB.Text = page.ToString();
            }
            LoadListViewPage();
        }

        private void PageNumber_TB_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            string inputSymbol = e.Text.ToString();
            if (!Regex.Match(inputSymbol, @"^[0-9]$").Success) { e.Handled = true; }
            else { e.Handled = false; }
        }

        private void Product_ListView_MouseLeftButtonUp(object sender, MouseButtonEventArgs e)
        {
            if (Product_ListView.SelectedItems.Count > 0) { Change_Btn.IsEnabled = true; }
            else { Change_Btn.IsEnabled = false; }
        }

        private void Change_Btn_Click(object sender, RoutedEventArgs e)
        {
            int sum = 0;
            foreach (Products product in Product_ListView.SelectedItems)
            {
                sum += product.Min_Agent_Price;
            }
            sum /= Product_ListView.SelectedItems.Count;
            CostChangeWindow newWindow = new CostChangeWindow(sum);
            if (newWindow.ShowDialog().Value == true)
            {
                foreach (Products product in Product_ListView.SelectedItems)
                {
                    product.Min_Agent_Price += newWindow.changedSum;
                }
                DBConnection.connection.SaveChanges();
            }
            Change_Btn.IsEnabled = false;
            SortListView();
            CalcMaxPages(newProductList);
            LoadListViewPage();
        }

        private void TypeFilter_CB_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            FilterUpdate();
        }
    }
}
