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
    public partial class Welcome : Form
    {
        int userid;
        const string constr = @"Data Source =DESKTOP-PEGIUMG\YEET;Initial Catalog = test1; Integrated Security = True";
        SqlConnection con = new SqlConnection(constr);
        SqlCommand cm = new SqlCommand();
        bool isfounder;
        public Welcome(string userID)
        {
            //userid = userID;   
            InitializeComponent();

            con.Open();
            string sql = "select [Is Founder], employee_id from Employees where User_ID = @userid";
            cm = new SqlCommand(sql, con);
            cm.Parameters.AddWithValue("@userid", userID);
            SqlDataAdapter da = new SqlDataAdapter(cm);
            DataTable d = new DataTable();
            
            da.Fill(d);
            //DataTableReader dtr = new DataTableReader(d);

            if (Convert.ToString(d.Rows[0]["Is Founder"]) != "True")
            {
                button3.Enabled = false;
                button4.Enabled = false;
                button6.Enabled = false;
            }

            userid = Convert.ToInt32(d.Rows[0]["employee_id"]);
            


            cm.Dispose();
            con.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            ViewProjects vp = new ViewProjects();
            vp.Show();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            View_Employees view_emp = new View_Employees();
            view_emp.Show();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Payments paym = new Payments();
            paym.Show();
        }

        private void button7_Click(object sender, EventArgs e)
        {

            UserProfile userProfile = new UserProfile(userid);
            userProfile.Show();
        }

        private void button8_Click(object sender, EventArgs e)
        {
            Login login = new Login();
            login.Show();
        }

        private void button9_Click()
        {
            MessageBox.Show(Convert.ToString(userid));
        }

        private void button4_Click(object sender, EventArgs e)
        {
            Project_Info project_Info = new Project_Info();
            project_Info.Show();
        }

        private void Welcome_Load(object sender, EventArgs e)
        {
            
        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void button9_Click(object sender, EventArgs e)
        {
            this.Close();

        }

        private void button8_Click_1(object sender, EventArgs e)
        {
            Login login = new Login();
            login.Show();
        }

        private void button10_Click(object sender, EventArgs e)
        {
            Volunteer_Info v_info = new Volunteer_Info();
            v_info.Show();
        }

        private void button11_Click(object sender, EventArgs e)
        {
            Donor_info donor_Info = new Donor_info();
            donor_Info.Show();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Payments payments = new Payments();
            payments.Show();
        }

        private void button12_Click(object sender, EventArgs e)
        {
            ViewVolunteers viewvol = new ViewVolunteers();
            viewvol.Show();
        }

        private void button13_Click(object sender, EventArgs e)
        {
            ViewDonor viewDonor = new ViewDonor();
            viewDonor.Show();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            Employee_Info empinfo = new Employee_Info();
            empinfo.Show();
        }
    }
}
