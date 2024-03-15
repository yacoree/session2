using System;
using System.Collections.Generic;
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
using System.Windows.Shapes;

namespace Import.Windows
{
    /// <summary>
    /// Логика взаимодействия для CostChangeWindow.xaml
    /// </summary>
    public partial class CostChangeWindow : Window
    {
        public int changedSum;
        public CostChangeWindow(int sum)
        {
            InitializeComponent();
            CostChange_TB.Text = sum.ToString();
        }

        private void CostChange_Btn_Click(object sender, RoutedEventArgs e)
        {
            changedSum = 0;
            try
            {
                changedSum = int.Parse(CostChange_TB.Text);
            }
            catch
            {
                MessageBox.Show("Incorrect input");
                this.DialogResult = false;
            }
            this.DialogResult = true;
        }
    }
}
