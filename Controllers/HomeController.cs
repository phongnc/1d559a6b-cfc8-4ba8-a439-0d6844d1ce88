using SSISApplication.Generator.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SSISApplication.Generator.Controllers
{
    public class AllowCrossSiteJsonAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var ctx = filterContext.RequestContext.HttpContext;
            var origin = ctx.Request.Headers["Origin"];
            var allowOrigin = !string.IsNullOrWhiteSpace(origin) ? origin : "*";
            ctx.Response.AddHeader("Access-Control-Allow-Origin", allowOrigin);
            ctx.Response.AddHeader("Access-Control-Allow-Headers", "*");
            ctx.Response.AddHeader("Access-Control-Allow-Credentials", "true");
            ctx.Response.AddHeader("Access-Control-Allow-Methods", "POST,GET");
            base.OnActionExecuting(filterContext);
        }
    }
    public class TemplateConfig
    {
        #region Sign Impl
        public static bool Client0_(string Table_Name)
        {
            Model1 db = new Model1();
            try
            {
                return db.Tables_tb.Count(o => (o.Table_Name == Table_Name) && (o.Use_As.Contains("Client0"))) > 0;
            }
            catch
            {
                return false;
            }
        }
        public static bool Report_(string Table_Name)
        {
            Model1 db = new Model1();
            try
            {
                return db.Tables_tb.Count(o => (o.Table_Name == Table_Name) && (o.Use_As.Contains("report"))) > 0;
            }
            catch
            {
                return false;
            }
        }
        public static bool Notification_(string Table_Name)
        {
            Model1 db = new Model1();
            try
            {
                return db.Tables_tb.Count(o => (o.Table_Name == Table_Name) && (o.Use_As.Contains("notification"))) > 0;
            }
            catch
            {
                return false;
            }
        }
        public static string Parent_(string Table_Name)
        {
            Model1 db = new Model1();
            try
            {
                return db.Columns_tb.First(o => (o.Table_Name == Table_Name) && (o.Use_As.Contains("parent"))).Column_Name.Replace("_id", "_Tb");
            }
            catch
            {
                return "";
            }
        }
        public static string Owner_(string Table_Name)
        {
            Model1 db = new Model1();
            try
            {
                return db.Columns_tb.First(o => (o.Table_Name == Table_Name) && (o.Use_As.Contains("owner"))).Column_Name;
            }
            catch
            {
                return "";
            }
        }
        public static string Scope_(string Table_Name)
        {
            Model1 db = new Model1();
            try
            {
                return db.Columns_tb.First(o => (o.Table_Name == Table_Name) && (o.Use_As.Contains("scope"))).Column_Name;
            }
            catch
            {
                return "";
            }
        }
        public static string Scope_Column_Name()
        {
            Model1 db = new Model1();
            try
            {
                return db.Columns_tb.First(o => o.Use_As.Contains("scope")).Column_Name;
            }
            catch
            {
                return "";
            }
        }
        public static string Select_(string Column_Name)
        {
            Model1 db = new Model1();
            try
            {
                return db.Columns_tb.First(o => (o.Column_Name == Column_Name) && (o.Use_As.Contains("optionvalue"))).Table_Name;
            }
            catch
            {
                return "";
            }
        }
        public static string Select_Value(string Table_Name)
        {
            // tra ve cot optionvalue
            Model1 db = new Model1();
            try
            {
                return db.Columns_tb.First(o => (o.Table_Name == Table_Name) && (o.Use_As.Contains("optionvalue"))).Column_Name;
            }
            catch
            {
                return "";
            }
        }
        public static string Select_Text(string Table_Name)
        {
            // tra ve cot optiontext
            Model1 db = new Model1();
            try
            {
                return db.Columns_tb.First(o => (o.Table_Name == Table_Name) && (o.Use_As.Contains("optiontext"))).Column_Name;
            }
            catch
            {
                return "";
            }
        }
        public static string Model_Name(string Table_Name)
        {
            return Table_Name.Replace("_Tb", "");
        }
        public static string Model_Display_Name(string Table_Name)
        {
            Model1 db = new Model1();
            try
            {
                return db.Tables_tb.First(o => o.Table_Name == Table_Name).Display_Name;
            }
            catch
            {
                return Model_Name(Table_Name);
            }
        }
        public static string Model_Object(string Table_Name)
        {
            try
            {
                string strModel_Object = Model_Name(Table_Name);
                int index = 0;
                for (int i = 1; i < strModel_Object.Length; i++)
                {
                    if (strModel_Object[i].ToString() == strModel_Object[i].ToString().ToLower())
                    {
                        index = i; break;
                    }
                }
                return strModel_Object.Substring(0, index - 1).ToLower() + strModel_Object.Substring(index - 1);
            }
            catch
            {
                return Model_Name(Table_Name);
            }
        }
        public static string Model_Title(string Table_Name)
        {
            Model1 db = new Model1();
            try
            {
                return db.Columns_tb.First(o => (o.Table_Name == Table_Name) && (o.Use_As.Contains("title"))).Column_Name;
            }
            catch
            {
                return "";
            }
        }
        #endregion
        public static string Generate_controller_cs_Index(string Table_Name)
        {
            Model1 db = new Model1();
            if (Owner_(Table_Name) == "") return "";
            string Template_Content = db.Templates_tb.First(o => o.Template_Name == "controller_cs_Index").Template_Content;
            return Template_Content.Replace("@Owner_Column_Name", Owner_(Table_Name));
        }
        public static string Generate_controller_cs_IndexByParent(string Table_Name)
        {
            Model1 db = new Model1();
            if (Parent_(Table_Name) == "") return "";
            string Template_Content = db.Templates_tb.First(o => o.Template_Name == "controller_cs_IndexByParent").Template_Content;
            return Template_Content.Replace("@Parent_Name", Model_Name(Parent_(Table_Name)));
        }
        public static string Generate_controller_cs_Report(string Table_Name)
        {
            Model1 db = new Model1();
            if (!Report_(Table_Name)) return "";
            string Template_Content = db.Templates_tb.First(o => o.Template_Name == "controller_cs_Report").Template_Content;
            return Template_Content.Replace("@Parent_Name", Model_Name(Parent_(Table_Name)));
        }
        public static string Generate_controller_cs_ReportCreateEdit(string Table_Name)
        {
            Model1 db = new Model1();
            if (!Report_(Table_Name)) return "";
            string Template_Content = db.Templates_tb.First(o => o.Template_Name == "controller_cs_ReportCreateEdit").Template_Content;
            return Template_Content
                .Replace("@controller_cs_ReportCreateEdit_Condition", Generate_controller_cs_ReportCreateEdit_Condition(Table_Name));
        }
        public static string Generate_controller_cs_ReportCreateEdit_Parameter(string Table_Name)
        {
            Model1 db = new Model1();
            string Template_Content = db.Templates_tb.First(o => o.Template_Name == "controller_cs_ReportModel").Template_Content;
            var list = db.Columns_tb.Where(o => o.Table_Name == Table_Name).ToList();
            string strTemplate_Content = "";
            for (int i = 0; i < list.Count; i++)
            {
                if (string.IsNullOrEmpty(list[i].Display_Name)) list[i].Display_Name = list[i].Column_Name;
                string tmpTemplate_Content = "";
                if (!string.IsNullOrEmpty(list[i].Use_As))
                {
                    if (list[i].Use_As.Contains("date")) tmpTemplate_Content = "public DateTime " + list[i].Column_Name + "f = new DateTime(); " + "public DateTime " + list[i].Column_Name + "t = new DateTime(); ";
                    if (list[i].Use_As.Contains("select"))
                    {
                        string tmpTable_Name = Select_(list[i].Column_Name);
                        tmpTemplate_Content = "public List<int> " + Model_Object(tmpTable_Name) + "s = new List<int>(); ";
                    }
                }
                tmpTemplate_Content = tmpTemplate_Content.Replace("@Field_Display_Name", list[i].Display_Name).Replace("@Field_Column_Name", list[i].Column_Name);
                strTemplate_Content += tmpTemplate_Content;
            }
            if (strTemplate_Content.EndsWith(", ")) strTemplate_Content = strTemplate_Content.Substring(0, strTemplate_Content.Length - 2);
            return Template_Content.Replace("@controller_cs_ReportCreateEdit_Parameter", strTemplate_Content);
        }
        public static string Generate_controller_cs_ReportCreateEdit_Condition(string Table_Name)
        {
            Model1 db = new Model1();
            var list = db.Columns_tb.Where(o => o.Table_Name == Table_Name).ToList();
            string strTemplate_Content = "";
            for (int i = 0; i < list.Count; i++)
            {
                if (string.IsNullOrEmpty(list[i].Display_Name)) list[i].Display_Name = list[i].Column_Name;
                string tmpTemplate_Content = "";
                if (!string.IsNullOrEmpty(list[i].Use_As))
                {
                    if (list[i].Use_As.Contains("date"))
                    {
                        //tmpTemplate_Content = "DateTime " + list[i].Column_Name + "f, " + "DateTime " + list[i].Column_Name + "t, ";
                    }
                    if (list[i].Use_As.Contains("select"))
                    {
                        string tmpTable_Name = Select_(list[i].Column_Name);
                        tmpTemplate_Content = ".Where(o => r." + Model_Object(tmpTable_Name) + "s.Contains(o." + Model_Name(tmpTable_Name) + "_id))";
                    }
                }
                tmpTemplate_Content = tmpTemplate_Content.Replace("@Field_Display_Name", list[i].Display_Name).Replace("@Field_Column_Name", list[i].Column_Name);
                strTemplate_Content += tmpTemplate_Content;
            }
            if (strTemplate_Content.EndsWith(", ")) strTemplate_Content = strTemplate_Content.Substring(0, strTemplate_Content.Length - 2);
            return strTemplate_Content;
        }
        public static string Generate_controller_cs_IndexSelect(string Table_Name)
        {
            try
            {
                if (Select_Value(Table_Name) == "") return "";
                if (Select_Text(Table_Name) == "") return "";
            }
            catch
            {
                return "";
            }
            Model1 db = new Model1();
            string Template_Content = "";
            if (Owner_(Table_Name) == "")
                Template_Content = db.Templates_tb.First(o => o.Template_Name == "controller_cs_IndexSelect").Template_Content.Replace("@Scope_Column_Name", Scope_Column_Name());
            else
                Template_Content = db.Templates_tb.First(o => o.Template_Name == "controller_cs_IndexSelect_Owner").Template_Content.Replace("@Owner_Column_Name", Owner_(Table_Name));
            return Template_Content.Replace("@Select_Value", Select_Value(Table_Name)).Replace("@Select_Text", Select_Text(Table_Name));
        }
        public static string Generate_controller_cs_Details_Scope(string Table_Name)
        {
            Model1 db = new Model1();
            if (Scope_(Table_Name) == "") return "";
            string Template_Content = db.Templates_tb.First(o => o.Template_Name == "controller_cs_Details_Scope").Template_Content;
            return Template_Content.Replace("@Scope_Column_Name", Scope_(Table_Name));
        }
        public static string Generate_controller_cs_Details_Owner(string Table_Name)
        {
            Model1 db = new Model1();
            if (Owner_(Table_Name) == "") return "";
            string Template_Content = db.Templates_tb.First(o => o.Template_Name == "controller_cs_Details_Owner").Template_Content;
            return Template_Content.Replace("@Owner_Column_Name", Owner_(Table_Name));
        }
        public static string Generate_controller_cs_CreateEdit_Notification(string Table_Name)
        {
            Model1 db = new Model1();
            if (!Notification_(Table_Name)) return "";
            string Template_Content = db.Templates_tb.First(o => o.Template_Name == "controller_cs_CreateEdit_Notification").Template_Content;
            return Template_Content;
        }
        public static string Generate_controller_cs_CreateEdit_Owner(string Table_Name)
        {
            Model1 db = new Model1();
            if (Owner_(Table_Name) == "") return "";
            string Template_Content = db.Templates_tb.First(o => o.Template_Name == "controller_cs_CreateEdit_Owner").Template_Content;
            return Template_Content.Replace("@Owner_Column_Name", Owner_(Table_Name));
        }
        public static string Generate_controller_cs(string Table_Name)
        {
            Model1 db = new Model1();
            string Template_Content = db.Templates_tb.First(o => o.Template_Name == "controller_cs").Template_Content;
            return Template_Content.Replace("@controller_cs_IndexOwner", Generate_controller_cs_Index(Table_Name))
                .Replace("@controller_cs_IndexByParent", Generate_controller_cs_IndexByParent(Table_Name))
                .Replace("@controller_cs_ReportCreateEdit", Generate_controller_cs_ReportCreateEdit(Table_Name))
                .Replace("@controller_cs_Report", Generate_controller_cs_Report(Table_Name))
                .Replace("@controller_cs_IndexSelect", Generate_controller_cs_IndexSelect(Table_Name))
                .Replace("@controller_cs_Details_Scope", Generate_controller_cs_Details_Scope(Table_Name))
                .Replace("@controller_cs_Details_Owner", Generate_controller_cs_Details_Owner(Table_Name))
                .Replace("@controller_cs_CreateEdit_Notification", Generate_controller_cs_CreateEdit_Notification(Table_Name))
                .Replace("@controller_cs_CreateEdit_Owner", Generate_controller_cs_CreateEdit_Owner(Table_Name));
        }
        public static string Generate_app_js_state(string Table_Name)
        {
            Model1 db = new Model1();
            string Template_Content = db.Templates_tb.First(o => o.Template_Name == "app_js_state").Template_Content;
            return Template_Content.Replace("@Action_Name", "Index").Replace("@Model_Param", "")
                + (Parent_(Table_Name) == "" ? "" : Template_Content.Replace("@Action_Name@Model_Name", "Index@Model_NameBy" + Model_Name(Parent_(Table_Name))).Replace("@Model_Param", ":" + Model_Object(Parent_(Table_Name)) + "_id"))
                + (Report_(Table_Name) ? Template_Content.Replace("@Action_Name", "Report").Replace("@Model_Param", "") : "")
                + Template_Content.Replace("@Action_Name", "Details").Replace("@Model_Param", ":" + Model_Object(Table_Name) + "_id");
        }
        public static string Generate_services_js_DataServices(string Table_Name)
        {
            Model1 db = new Model1();
            string Template_Content = db.Templates_tb.First(o => o.Template_Name == "services_js_DataServices").Template_Content;
            return Template_Content.Replace("@Parent_Name", Model_Name(Parent_(Table_Name))).Replace("@Parent_Object", Model_Object(Parent_(Table_Name)));
        }
        public static string Generate_controllers_js_Index(string Table_Name)
        {
            if (Table_Name.EndsWith("Ex_Tb")) return "";
            Model1 db = new Model1();
            string Template_Content = db.Templates_tb.First(o => o.Template_Name == "controllers_js_Index").Template_Content;
            return Template_Content;
        }
        public static string Generate_controllers_js_IndexByParent(string Table_Name)
        {
            if (Parent_(Table_Name) == "") return "";
            Model1 db = new Model1();
            string Template_Content = db.Templates_tb.First(o => o.Template_Name == "controllers_js_IndexByParent").Template_Content;
            return Template_Content.Replace("@Parent_Name", Model_Name(Parent_(Table_Name))).Replace("@Parent_Object", Model_Object(Parent_(Table_Name)));
        }
        public static string Generate_controllers_js_Report(string Table_Name)
        {
            if (!Report_(Table_Name)) return "";
            if (Parent_(Table_Name) == "") return "";
            Model1 db = new Model1();
            string Template_Content = db.Templates_tb.First(o => o.Template_Name == "controllers_js_Report").Template_Content;
            return Template_Content.Replace("@Parent_Name", Model_Name(Parent_(Table_Name))).Replace("@Parent_Object", Model_Object(Parent_(Table_Name)));
        }
        public static string Generate_controllers_js_Details_Field_Select(string Table_Name)
        {
            Model1 db = new Model1();
            string Template_Content = db.Templates_tb.First(o => o.Template_Name == "controllers_js_Details_Field_Select").Template_Content;
            string strTemplate_Content = "";
            var list = db.Columns_tb.Where(o => ((o.Table_Name == Table_Name) && o.Use_As.Contains("select"))).ToList();
            for (int i = 0; i < list.Count; i++)
            {
                if (!string.IsNullOrEmpty(Select_(list[i].Column_Name)))
                {
                    string tmpTable_Name = Select_(list[i].Column_Name);
                    strTemplate_Content += Template_Content.Replace("@Select_Name", Model_Name(tmpTable_Name)).Replace("@Select_Object", Model_Object(tmpTable_Name)).Replace("@Select_Value", Select_Value(tmpTable_Name)) + "\r\n";
                }
            }
            return strTemplate_Content;
        }
        public static string Generate_controllers_js_Details(string Table_Name)
        {
            Model1 db = new Model1();
            string Template_Content = db.Templates_tb.First(o => o.Template_Name == "controllers_js_Details").Template_Content;
            return Template_Content.Replace("@controllers_js_Details_Field_Select", Generate_controllers_js_Details_Field_Select(Table_Name));
        }
        public static string Generate_controllers_js_CreateEdit_Field_Parent(string Table_Name)
        {
            if (Parent_(Table_Name) == "") return "";
            Model1 db = new Model1();
            string Template_Content = db.Templates_tb.First(o => o.Template_Name == "controllers_js_CreateEdit_Field_Parent").Template_Content;
            return Template_Content.Replace("@Parent_Name", Model_Name(Parent_(Table_Name))).Replace("@Parent_Object", Model_Object(Parent_(Table_Name)));
        }
        public static string Generate_controllers_js_CreateEdit_Field_Select(string Table_Name)
        {
            Model1 db = new Model1();
            string Template_Content = db.Templates_tb.First(o => o.Template_Name == "controllers_js_CreateEdit_Field_Select").Template_Content;
            string strTemplate_Content = "";
            var list = db.Columns_tb.Where(o => ((o.Table_Name == Table_Name) && o.Use_As.Contains("select"))).ToList();
            for (int i = 0; i < list.Count; i++)
            {
                if (!string.IsNullOrEmpty(Select_(list[i].Column_Name)))
                {
                    string tmpTable_Name = Select_(list[i].Column_Name);
                    strTemplate_Content += Template_Content.Replace("@Select_Name", Model_Name(tmpTable_Name)).Replace("@Select_Object", Model_Object(tmpTable_Name)) + "\r\n";
                }
            }
            return strTemplate_Content;
        }
        public static string Generate_controllers_js_CreateEdit(string Table_Name)
        {
            Model1 db = new Model1();
            string Template_Content = db.Templates_tb.First(o => o.Template_Name == "controllers_js_CreateEdit").Template_Content;
            return Template_Content
                .Replace("@controllers_js_CreateEdit_Field_Parent", Generate_controllers_js_CreateEdit_Field_Parent(Table_Name))
                .Replace("@controllers_js_CreateEdit_Field_Select", Generate_controllers_js_CreateEdit_Field_Select(Table_Name));
        }
        public static string Generate_controllers_js_ReportCreateEdit(string Table_Name)
        {
            if (!Report_(Table_Name)) return "";
            Model1 db = new Model1();
            string Template_Content = db.Templates_tb.First(o => o.Template_Name == "controllers_js_ReportCreateEdit").Template_Content;
            return Template_Content
                .Replace("@controllers_js_ReportCreateEdit_Field_Parent", Generate_controllers_js_CreateEdit_Field_Parent(Table_Name))
                .Replace("@controllers_js_ReportCreateEdit_Field_Date2", Generate_controllers_js_ReportCreateEdit_Field_Date(Table_Name))
                .Replace("@controllers_js_ReportCreateEdit_Field_Select2", Generate_controllers_js_ReportCreateEdit_Field_Select(Table_Name, "2"))
                .Replace("@controllers_js_ReportCreateEdit_Field_Select", Generate_controllers_js_ReportCreateEdit_Field_Select(Table_Name, ""));
        }
        public static string Generate_controllers_js_ReportCreateEdit_Field_Date(string Table_Name)
        {
            Model1 db = new Model1();
            string Template_Content = db.Templates_tb.First(o => o.Template_Name == "controllers_js_ReportCreateEdit_Field_Date2").Template_Content;
            string strTemplate_Content = "";
            var list = db.Columns_tb.Where(o => ((o.Table_Name == Table_Name) && o.Use_As.Contains("select"))).ToList();
            for (int i = 0; i < list.Count; i++)
            {
                if (!string.IsNullOrEmpty(Select_(list[i].Column_Name)))
                {
                    string tmpTable_Name = Select_(list[i].Column_Name);
                    strTemplate_Content += Template_Content.Replace("@Select_Name", Model_Name(tmpTable_Name)).Replace("@Select_Object", Model_Object(tmpTable_Name)) + "\r\n";
                }
            }
            return strTemplate_Content;
        }
        public static string Generate_controllers_js_ReportCreateEdit_Field_Select(string Table_Name, string idx)
        {
            Model1 db = new Model1();
            string Template_Name = "controllers_js_ReportCreateEdit_Field_Select" + idx;
            string Template_Content = db.Templates_tb.First(o => o.Template_Name == Template_Name).Template_Content;
            string strTemplate_Content = "";
            var list = db.Columns_tb.Where(o => ((o.Table_Name == Table_Name) && o.Use_As.Contains("date"))).ToList();
            for (int i = 0; i < list.Count; i++)
            {
                strTemplate_Content += Template_Content.Replace("@Field_Display_Name", list[i].Display_Name).Replace("@Field_Column_Name", list[i].Column_Name);
            }
            return strTemplate_Content;
        }
        public static string Generate_templates_html_Index(string Table_Name)
        {
            Model1 db = new Model1();
            string templates_html_Index = "templates_html_Index";
            try
            {
                if (db.Tables_tb.First(o => o.Table_Name == Table_Name).Use_As.Contains("Index0")) templates_html_Index = "templates_html_Index0";
            }
            catch { }
            try
            {
                if (db.Tables_tb.First(o => o.Table_Name == Table_Name).Use_As.Contains("Index1")) templates_html_Index = "templates_html_Index1";
            }
            catch { }
            string Template_Content = db.Templates_tb.First(o => o.Template_Name == templates_html_Index).Template_Content;
            return Template_Content;
        }
        public static string Generate_templates_html_IndexByParent(string Table_Name)
        {
            if (Parent_(Table_Name) == "") return "";
            Model1 db = new Model1();
            string templates_html_Index = "templates_html_Index";
            try
            {
                if (db.Tables_tb.First(o => o.Table_Name == Table_Name).Use_As.Contains("Index0")) templates_html_Index = "templates_html_Index0";
            }
            catch { }
            try
            {
                if (db.Tables_tb.First(o => o.Table_Name == Table_Name).Use_As.Contains("Index1")) templates_html_Index = "templates_html_Index1";
            }
            catch { }
            string Template_Content = db.Templates_tb.First(o => o.Template_Name == templates_html_Index).Template_Content;
            return Template_Content = Template_Content.Replace("// Index@Model_Name.html", "// Index@Model_NameBy@Parent_Name.html").Replace("@Parent_Name", Model_Name(Parent_(Table_Name)));
        }
        public static string Generate_templates_html_Report(string Table_Name)
        {
            if (!Report_(Table_Name)) return "";
            Model1 db = new Model1();
            string templates_html_Index = "templates_html_Report";
            string Template_Content = db.Templates_tb.First(o => o.Template_Name == templates_html_Index).Template_Content;
            return Template_Content;
        }
        public static string Generate_templates_html_Details_Childs(string Table_Name)
        {
            Model1 db = new Model1();
            string strTable_Name = Model_Name(Table_Name);
            var list = db.Columns_tb.Where(o => (o.Column_Name == (strTable_Name + "_id")) && (o.Use_As.Contains("parent")) && (!o.Table_Name.EndsWith("Ex_Tb"))).ToList();
            string strTemplate_Content = "";
            for (int i = 0; i < list.Count; i++)
            {
                string tmpTemplate_Content = db.Templates_tb.First(o => o.Template_Name == "templates_html_Details_Childs").Template_Content;
                if (string.IsNullOrEmpty(Model_Display_Name(list[i].Table_Name))) tmpTemplate_Content = tmpTemplate_Content.Replace("@Child_Display_Name", Model_Display_Name(list[i].Table_Name));
                else tmpTemplate_Content = tmpTemplate_Content.Replace("@Child_Display_Name", Model_Name(list[i].Table_Name));
                tmpTemplate_Content = tmpTemplate_Content.Replace("@Child_Name", Model_Name(list[i].Table_Name));
                strTemplate_Content += tmpTemplate_Content;
            }
            return strTemplate_Content;
        }
        public static string Generate_templates_html_Details_Columns(string Table_Name)
        {
            Model1 db = new Model1();
            var list = db.Columns_tb.Where(o => o.Table_Name == Table_Name).ToList();
            string strTemplate_Content = "";
            for (int i = 0; i < list.Count; i++)
            {
                string tmpTemplate_Content = db.Templates_tb.First(o => o.Template_Name == "templates_html_Details_Columns").Template_Content;
                try
                {
                    if (list[i].Use_As.Contains("diplaynone")) tmpTemplate_Content = tmpTemplate_Content.Replace("@Field_Hidden", "display:none;"); else tmpTemplate_Content = tmpTemplate_Content.Replace("@Field_Hidden", "");
                }
                catch
                {
                    tmpTemplate_Content = tmpTemplate_Content.Replace("@Field_Hidden", "");
                }
                if (string.IsNullOrEmpty(list[i].Display_Name)) list[i].Display_Name = list[i].Column_Name;
                strTemplate_Content += tmpTemplate_Content.Replace("@Field_Display_Name", list[i].Display_Name).Replace("@Field_Column_Name", list[i].Column_Name);
            }
            return strTemplate_Content;
        }
        public static string Generate_templates_html_Details(string Table_Name)
        {
            Model1 db = new Model1();
            string Template_Content = db.Templates_tb.First(o => o.Template_Name == "templates_html_Details").Template_Content;
            return Template_Content.Replace("@templates_html_Details_Childs", Generate_templates_html_Details_Childs(Table_Name))
                .Replace("@templates_html_Details_Columns", Generate_templates_html_Details_Columns(Table_Name));
        }
        public static string Generate_templates_html_CreateEdit_Columns(string Table_Name)
        {
            Model1 db = new Model1();
            string Template_Content = db.Templates_tb.First(o => o.Template_Name == "templates_html_CreateEdit_Columns").Template_Content;
            string Template_Content_Select = db.Templates_tb.First(o => o.Template_Name == "templates_html_CreateEdit_Columns_Select").Template_Content;
            string Template_Content_TextArea = db.Templates_tb.First(o => o.Template_Name == "templates_html_CreateEdit_Columns_TextArea").Template_Content;
            var list = db.Columns_tb.Where(o => o.Table_Name == Table_Name).ToList();
            string strTemplate_Content = "";
            for (int i = 0; i < list.Count; i++)
            {
                if (string.IsNullOrEmpty(list[i].Display_Name)) list[i].Display_Name = list[i].Column_Name;
                string tmpTemplate_Content = Template_Content;
                try
                {
                    if (list[i].Use_As.Contains("diplaynone")) tmpTemplate_Content = tmpTemplate_Content.Replace("@Field_Hidden", "display:none;");
                    else tmpTemplate_Content = tmpTemplate_Content.Replace("@Field_Hidden", "");
                }
                catch
                {
                    tmpTemplate_Content = tmpTemplate_Content.Replace("@Field_Hidden", "");
                }
                if (list[i].Column_Name == Model_Name(list[i].Table_Name) + "_id") tmpTemplate_Content = tmpTemplate_Content.Replace("@Field_Use_Type", "hidden");
                if (!string.IsNullOrEmpty(list[i].Use_As))
                {
                    if (list[i].Use_As.Contains("hidden")) tmpTemplate_Content = tmpTemplate_Content.Replace("@Field_Use_Type", "hidden");
                    if (list[i].Use_As.Contains("parent")) tmpTemplate_Content = tmpTemplate_Content.Replace("@Field_Use_Type", "hidden");
                    if (list[i].Use_As.Contains("number")) tmpTemplate_Content = tmpTemplate_Content.Replace("@Field_Use_Type", "number");
                    if (list[i].Use_As.Contains("date")) tmpTemplate_Content = tmpTemplate_Content.Replace("@Field_Use_Type", "date\" fix-input-date \"");
                    if (list[i].Use_As.Contains("tel")) tmpTemplate_Content = tmpTemplate_Content.Replace("@Field_Use_Type", "tel");
                    if (list[i].Use_As.Contains("email")) tmpTemplate_Content = tmpTemplate_Content.Replace("@Field_Use_Type", "email");
                    if (list[i].Use_As.Contains("editor")) tmpTemplate_Content = Template_Content_TextArea;
                    if (list[i].Use_As.Contains("select"))
                    {
                        string tmpTable_Name = Select_(list[i].Column_Name);
                        tmpTemplate_Content = Template_Content_Select
                            .Replace("@Select_Object", Model_Object(tmpTable_Name)).Replace("@Select_Value", Select_Value(tmpTable_Name)).Replace("@Select_Text", Select_Text(tmpTable_Name));
                    }
                }
                tmpTemplate_Content = tmpTemplate_Content.Replace("@Field_Use_Type", "text");
                tmpTemplate_Content = tmpTemplate_Content.Replace("@Field_Display_Name", list[i].Display_Name).Replace("@Field_Column_Name", list[i].Column_Name);
                strTemplate_Content += tmpTemplate_Content;
            }
            return strTemplate_Content;
        }
        public static string Generate_templates_html_CreateEdit(string Table_Name)
        {
            Model1 db = new Model1();
            string Template_Content = db.Templates_tb.First(o => o.Template_Name == "templates_html_CreateEdit").Template_Content;
            return Template_Content.Replace("@templates_html_CreateEdit_Columns", Generate_templates_html_CreateEdit_Columns(Table_Name)); ;
        }
        public static string Generate_templates_html_ReportCreateEdit_Columns(string Table_Name)
        {
            Model1 db = new Model1();
            string Template_Content_Date = db.Templates_tb.First(o => o.Template_Name == "templates_html_ReportCreateEdit_Columns_Date").Template_Content;
            string Template_Content_Select = db.Templates_tb.First(o => o.Template_Name == "templates_html_ReportCreateEdit_Columns_Select").Template_Content;
            var list = db.Columns_tb.Where(o => o.Table_Name == Table_Name).ToList();
            string strTemplate_Content = "";
            for (int i = 0; i < list.Count; i++)
            {
                if (string.IsNullOrEmpty(list[i].Display_Name)) list[i].Display_Name = list[i].Column_Name;
                string tmpTemplate_Content = "";
                if (!string.IsNullOrEmpty(list[i].Use_As))
                {
                    if (list[i].Use_As.Contains("date")) tmpTemplate_Content = Template_Content_Date.Replace("@Field_Use_Type", "date\" fix-input-date \"");
                    if (list[i].Use_As.Contains("select"))
                    {
                        string tmpTable_Name = Select_(list[i].Column_Name);
                        tmpTemplate_Content = Template_Content_Select
                            .Replace("@Select_Object", Model_Object(tmpTable_Name)).Replace("@Select_Value", Select_Value(tmpTable_Name)).Replace("@Select_Text", Select_Text(tmpTable_Name));
                    }
                }
                tmpTemplate_Content = tmpTemplate_Content.Replace("@Field_Display_Name", list[i].Display_Name).Replace("@Field_Column_Name", list[i].Column_Name);
                strTemplate_Content += tmpTemplate_Content;
            }
            return strTemplate_Content;
        }
        public static string Generate_templates_html_ReportCreateEdit(string Table_Name)
        {
            if (!Report_(Table_Name)) return "";
            Model1 db = new Model1();
            string Template_Content = db.Templates_tb.First(o => o.Template_Name == "templates_html_ReportCreateEdit").Template_Content;
            return Template_Content.Replace("@templates_html_ReportCreateEdit_Columns", Generate_templates_html_ReportCreateEdit_Columns(Table_Name)); ;
        }
        public static void Generate_templates_html_files(string Table_Name)
        {
            Savefile(Replace(Generate_templates_html_Index(Table_Name), Table_Name).Replace("// Index@Model_Name.html".Replace("@Model_Name", Model_Name(Table_Name)), ""), "Index@Model_Name.html".Replace("@Model_Name", Model_Name(Table_Name)));
            Savefile(Replace(Generate_templates_html_IndexByParent(Table_Name), Table_Name).Replace("// Index@Model_NameBy@Parent_Name.html".Replace("@Model_Name", Model_Name(Table_Name)).Replace("@Parent_Name", Model_Name(Parent_(Table_Name))), ""), "Index@Model_NameBy@Parent_Name.html".Replace("@Model_Name", Model_Name(Table_Name)).Replace("@Parent_Name", Model_Name(Parent_(Table_Name))));
            Savefile(Replace(Generate_templates_html_Report(Table_Name), Table_Name).Replace("// Report@Model_Name.html".Replace("@Model_Name", Model_Name(Table_Name)), ""), "Report@Model_Name.html".Replace("@Model_Name", Model_Name(Table_Name)));
            Savefile(Replace(Generate_templates_html_Details(Table_Name), Table_Name).Replace("// Details@Model_Name.html".Replace("@Model_Name", Model_Name(Table_Name)), ""), "Details@Model_Name.html".Replace("@Model_Name", Model_Name(Table_Name)));
            Savefile(Replace(Generate_templates_html_CreateEdit(Table_Name), Table_Name).Replace("// CreateEdit@Model_Name.html".Replace("@Model_Name", Model_Name(Table_Name)), ""), "CreateEdit@Model_Name.html".Replace("@Model_Name", Model_Name(Table_Name)));
            Savefile(Replace(Generate_templates_html_ReportCreateEdit(Table_Name), Table_Name).Replace("// ReportCreateEdit@Model_Name.html".Replace("@Model_Name", Model_Name(Table_Name)), ""), "ReportCreateEdit@Model_Name.html".Replace("@Model_Name", Model_Name(Table_Name)));
        }
        public static void Savefile(string content, string filename)
        {
            using (StreamWriter writer = new StreamWriter(HttpContext.Current.Server.MapPath("~/App_Data/" + filename), false))
            {
                writer.WriteLine(content);
            }
        }
        public static string Replace(string content, string Table_Name)
        {
            return content
                .Replace("@Model_Name", Model_Name(Table_Name)).Replace("@Model_Object", Model_Object(Table_Name))
                .Replace("@Model_Display_Name", Model_Display_Name(Table_Name)).Replace("@Model_Title", Model_Title(Table_Name));
        }
        public static string Generate(string Table_Name)
        {
            string Template_Content = Generate_controller_cs(Table_Name);
            if (!Client0_(Table_Name))
            {
                Template_Content += "\r\n" + Generate_app_js_state(Table_Name);
                Template_Content += "\r\n" + Generate_services_js_DataServices(Table_Name);
                Template_Content += "\r\n" + Generate_controllers_js_Index(Table_Name);
                Template_Content += "\r\n" + Generate_controllers_js_IndexByParent(Table_Name);
                Template_Content += "\r\n" + Generate_controllers_js_Report(Table_Name);
                Template_Content += "\r\n" + Generate_controllers_js_Details(Table_Name);
                Template_Content += "\r\n" + Generate_controllers_js_CreateEdit(Table_Name);
                Template_Content += "\r\n" + Generate_controllers_js_ReportCreateEdit(Table_Name);
                Template_Content += "\r\n" + Generate_templates_html_Index(Table_Name);
                Template_Content += "\r\n" + Generate_templates_html_IndexByParent(Table_Name);
                Template_Content += "\r\n" + Generate_templates_html_Report(Table_Name);
                Template_Content += "\r\n" + Generate_templates_html_ReportCreateEdit(Table_Name);
                Template_Content += "\r\n" + Generate_templates_html_Details(Table_Name);
                Template_Content += "\r\n" + Generate_templates_html_CreateEdit(Table_Name);
                Generate_templates_html_files(Table_Name);
            }
            return Replace(Template_Content, Table_Name);
        }
        public static string Generateall_controller_cs()
        {
            Model1 db = new Model1();
            string Template_Wrapper = db.Templates_tb.First(o => o.Template_Name == "_APPController_cs").Template_Content;
            var list = db.Tables_tb.ToList();
            string Template_Content = "";

            for (int i = 0; i < list.Count; i++)
            {
                if (Report_(list[i].Table_Name)) Template_Wrapper = Template_Wrapper.Replace("// ReportModelClass", Generate_controller_cs_ReportCreateEdit_Parameter(list[i].Table_Name));
                Template_Content += Replace(Generate_controller_cs(list[i].Table_Name), list[i].Table_Name);
            }
            return Template_Wrapper.Replace("// ApiControllers", Template_Content);
        }
        public static string Generateall_sql_script()
        {
            Model1 db = new Model1();
            string sql = db.Templates_tb.First(o => o.Template_Name == "__SQLScript").Template_Content;
            sql = sql.Replace("CREATE TABLE", "#CREATE TABLE");
            List<string> sqls = sql.Split(new char[] { '#' }).ToList();
            sql = "";
            for (int i = 0; i < sqls.Count; i++)
            {
                try
                {
                    sqls[i] = sqls[i].Replace("CONSTRAINT [PK_", "#CONSTRAINT [PK_");
                    List<string> sqlss = sqls[i].Split(new char[] { '#' }).ToList().Where(o => o.StartsWith("CREATE TABLE")).ToList();
                    for (int j = 0; j < sqlss.Count; j++)
                    {
                        if (sqlss[j].StartsWith("CREATE TABLE"))
                        {
                            sqlss[j] = sqlss[j].Replace("CONSTRAINT", "#CONSTRAINT");
                            var xxx = sqlss[j].Split(new char[] { '#' }).ToList();
                            sqlss[j] = "";
                            for (int x = 0; x < xxx.Count; x++)
                            {
                                if (xxx[x].StartsWith("CONSTRAINT")) {
                                    if (xxx[x].Contains(","))
                                    {
                                        xxx[x] = xxx[x].Substring(xxx[x].IndexOf(','));
                                        sqlss[j] += xxx[x];
                                    }
                                }
                                else { sqlss[j] += xxx[x]; }
                            }

                            string sql1 = sqlss[j].Replace("\r", "").Replace("\n", "").Replace("\t", "").Replace("[", "").Replace("]", "").Replace("dbo.", "").Replace(" ,", ",")
                                .Replace("int IDENTITY(1,1) NOT NULL", "INT AUTO_INCREMENT")
                                .Trim();
                            if (sql1.EndsWith(",")) sql1 = sql1.Substring(0, sql1.Length - 1);
                            if (!sql1.EndsWith(")")) sql1 += ")";
                            sql += ";" + sql1;
                        }
                    }
                }
                catch { }
            }

            var list = db.Tables_tb.ToList();

            for (int i = 0; i < list.Count; i++)
            {
                sql += "\r\n" + "alasql.tables." + list[i].Table_Name + ".data = localDB.SSISDB.tables." + list[i].Table_Name + ".data;";
                sql += "\r\n" + @"alasql.databases[""SSISDB""].tables[""" + list[i].Table_Name + @"""].identities = localDB.SSISDB.tables." + list[i].Table_Name + ".identities;";
            }
            return sql;
        }
        public static string Generateall_app_js_menu()
        {
            Model1 db = new Model1();
            var list = db.Tables_tb.Where(o => o.Table_Name.EndsWith("Ux_Tb")).ToList();
            try { list.AddRange(db.Tables_tb.Where(o => o.Use_As.Contains("menu")).ToList()); }
            catch { }
            string Template_Content = db.Templates_tb.First(o => o.Template_Name == "app_js_menu").Template_Content;
            string tmpTemplate_Content = "";
            for (int i = 0; i < list.Count; i++)
            {
                tmpTemplate_Content += Replace(Template_Content.Replace("@Count", (i + 1).ToString()), list[i].Table_Name);
            }
            return tmpTemplate_Content;
        }
        public static string Generateall_app_js_state()
        {
            Model1 db = new Model1();
            var list = db.Tables_tb.ToList();
            string Template_Content = "";
            for (int i = 0; i < list.Count; i++)
            {
                if (!Client0_(list[i].Table_Name))
                {
                    Template_Content += Replace(Generate_app_js_state(list[i].Table_Name), list[i].Table_Name);
                }
            }
            return Template_Content.Replace("// app.js", "");
        }
        public static string Generateall_services_js_DataServices()
        {
            Model1 db = new Model1();
            string Template_Wrapper = db.Templates_tb.First(o => o.Template_Name == "_services_js_DataServices").Template_Content;
            var list = db.Tables_tb.ToList();
            string Template_Content = "";
            for (int i = 0; i < list.Count; i++)
            {
                if (!Client0_(list[i].Table_Name))
                {
                    Template_Content += Replace(Generate_services_js_DataServices(list[i].Table_Name), list[i].Table_Name);
                }
            }
            return Template_Wrapper.Replace("// DataServices", Template_Content);
        }
        public static string Generateall_controllers_js()
        {
            Model1 db = new Model1();
            var list = db.Tables_tb.ToList();
            string Template_Content = "";
            for (int i = 0; i < list.Count; i++)
            {
                if (!Client0_(list[i].Table_Name))
                {
                    Template_Content += Replace(Generate_controllers_js_Index(list[i].Table_Name), list[i].Table_Name);
                    Template_Content += Replace(Generate_controllers_js_IndexByParent(list[i].Table_Name), list[i].Table_Name);
                    Template_Content += Replace(Generate_controllers_js_Report(list[i].Table_Name), list[i].Table_Name);
                    Template_Content += Replace(Generate_controllers_js_Details(list[i].Table_Name), list[i].Table_Name);
                }
            }
            for (int i = 0; i < list.Count; i++)
            {
                if (!Client0_(list[i].Table_Name))
                {
                    Template_Content += Replace(Generate_controllers_js_CreateEdit(list[i].Table_Name), list[i].Table_Name);
                    Template_Content += Replace(Generate_controllers_js_ReportCreateEdit(list[i].Table_Name), list[i].Table_Name);
                }
            }
            return Template_Content;
        }
        public static string Generateall_templates_html()
        {
            Model1 db = new Model1();
            var list = db.Tables_tb.ToList();
            string Template_Content = "";
            for (int i = 0; i < list.Count; i++)
            {
                if (!Client0_(list[i].Table_Name))
                {
                    Template_Content += Replace(Generate_templates_html_Index(list[i].Table_Name), list[i].Table_Name);
                    Template_Content += Replace(Generate_templates_html_IndexByParent(list[i].Table_Name), list[i].Table_Name);
                    Template_Content += Replace(Generate_templates_html_Report(list[i].Table_Name), list[i].Table_Name);
                    Template_Content += Replace(Generate_templates_html_Details(list[i].Table_Name), list[i].Table_Name);
                    Template_Content += Replace(Generate_templates_html_CreateEdit(list[i].Table_Name), list[i].Table_Name);
                    Template_Content += Replace(Generate_templates_html_ReportCreateEdit(list[i].Table_Name), list[i].Table_Name);
                    Generate_templates_html_files(list[i].Table_Name);
                }
            }
            return Template_Content;
        }
    }
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult Script()
        {
            return View();
        }
    }
}