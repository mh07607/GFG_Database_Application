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
    public partial class Volunteer_Info : Form
    {
        const string constr = @"Data Source =DESKTOP-PEGIUMG\YEET;Initial Catalog = test1; Integrated Security = True";
        SqlConnection con = new SqlConnection(constr);
        SqlCommand cm = new SqlCommand();
        int volunteer_id;
        //int volunteer_id;
        public Volunteer_Info(int v_id = -1)
        {
            volunteer_id = v_id;
            InitializeComponent();

            if(v_id != -1)
            {
                button1.Enabled = false;
                button2.Enabled = true;
                button3.Enabled = true;

                con.Open();
                string sql = "select * from Volunteer where volunteer_id = @volunteer_id";
                cm = new SqlCommand(sql, con);
                cm.Parameters.AddWithValue("@volunteer_id", volunteer_id);
                SqlDataAdapter da = new SqlDataAdapter(cm);
                DataTable d = new DataTable();

                da.Fill(d);

                textBox1.Text = Convert.ToString(d.Rows[0]["Volunteer_Name"]);
                textBox2.Text = Convert.ToString(d.Rows[0]["Phone_Number"]);
                textBox3.Text = Convert.ToString(d.Rows[0]["Address"]);
                textBox4.Text = Convert.ToString(d.Rows[0]["CNIC"]);



                cm.Dispose();
                con.Close();

            }

           
        }

        private void button3_Click(object sender, EventArgs e)
        {
            con.Open();
            string sql = "delete Volunteer_of_Project where volunteer_id = @VolunteerID";
            cm = new SqlCommand(sql, con);
           
            cm.Parameters.AddWithValue("@VolunteerID", volunteer_id);
            
            cm.ExecuteNonQuery();

            sql = "delete Volunteer where volunteer_id = @VolunteerID";
            cm = new SqlCommand(sql, con);
            cm.Parameters.AddWithValue("@VolunteerID", volunteer_id);

            cm.ExecuteNonQuery();

            MessageBox.Show("Volunteer has been succesfully deleted from the database.");
            cm.Dispose();
            con.Close();
        }

        private void Volunteer_Info_Load(object sender, EventArgs e)
        {

        }

        private void button4_Click(object sender, EventArgs e)
        {
            this.Hide();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            con.Open();
            string sql = "exec INS_VOL @VolunteerName, @PhoneNo, @VolAddress, @VolCNIC";
            cm = new SqlCommand(sql, con);
            cm.Parameters.AddWithValue("@VolunteerName", textBox1.Text);
            cm.Parameters.AddWithValue("@PhoneNo", textBox2.Text);
            cm.Parameters.AddWithValue("@VolAddress", textBox3.Text);
            cm.Parameters.AddWithValue("@VolCNIC", textBox4.Text);

            cm.ExecuteNonQuery();
            con.Close();
            this.Hide();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            con.Open();
            string sql = "exec UPDATE_VOL @VolunteerID, @VolunteerName, @PhoneNo, @VolAddress, @VolCNIC";
            cm = new SqlCommand(sql, con);
            cm.Parameters.AddWithValue("@VolunteerID", volunteer_id);
            cm.Parameters.AddWithValue("@VolunteerName", textBox1.Text);
            cm.Parameters.AddWithValue("@PhoneNo", textBox2.Text);
            cm.Parameters.AddWithValue("@VolAddress", textBox3.Text);
            cm.Parameters.AddWithValue("@VolCNIC", textBox4.Text);

            cm.ExecuteNonQuery();
            con.Close();
            this.Hide();
        }
    }
}
