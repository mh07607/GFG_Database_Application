using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace gfg_dbfinalproject
{
    public partial class Donor_info : Form
    {
        const string constr = @"Data Source =DESKTOP-PEGIUMG\YEET;Initial Catalog = test1; Integrated Security = True";
        SqlConnection con = new SqlConnection(constr);
        SqlCommand cm = new SqlCommand();
        int donor_id;
        public Donor_info(int d_id = -1)
        {
            donor_id = d_id;
            InitializeComponent();

            if(donor_id != -1)
            {
                button1.Enabled = false;
                button2.Enabled = true;
                button3.Enabled = true; 

            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            con.Open();
            string sql = "delete from Donor where donor_id = @donor_id";
            cm = new SqlCommand(sql, con);
            cm.Parameters.AddWithValue("@donor_id", donor_id);
            MessageBox.Show("Donor has been succesfully deleted from the database.");
            cm.Dispose();
            con.Close();

            /*SqlDataAdapter da = new SqlDataAdapter(cm);
            DataTable d = new DataTable();
            da.Fill(d);
            cm.Dispose();
            con.Close();
            //dataGridView1.DataSource = d;*/
        }

        private void button1_Click(object sender, EventArgs e)
        {
            con.Open();
            string sql = "exec INS_DON @DonName, @DonType, @PhoneNo";
            cm = new SqlCommand(sql, con);
            cm.Parameters.AddWithValue("@DonName", textBox1.Text);
            cm.Parameters.AddWithValue("@DonType", textBox2.Text);
            cm.Parameters.AddWithValue("@PhoneNo", textBox3.Text);

            cm.ExecuteNonQuery();
            con.Close();
            this.Hide();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            this.Hide();
        }

        private void Donor_info_Load(object sender, EventArgs e)
        {

        }
    }
}
