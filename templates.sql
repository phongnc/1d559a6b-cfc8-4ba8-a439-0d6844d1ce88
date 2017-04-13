USE [SSIS_IPM2]
GO
INSERT [dbo].[Templates_tb] ([Template_Name], [Template_Content]) VALUES (N'__SQLScript', NULL)
GO
INSERT [dbo].[Templates_tb] ([Template_Name], [Template_Content]) VALUES (N'_APPController_cs', N'using SSISApplication.API.Entities;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Security.Claims;
using System.Web.Http;

namespace SSISApplication.API.Controllers
{
// ReportModelClass
// ApiControllers    
}')
GO
INSERT [dbo].[Templates_tb] ([Template_Name], [Template_Content]) VALUES (N'_services_js_DataServices', N'app.service(''DataServices'', function ($http, $q, $state, $ionicLoading) {
    var token = '''';
    var apiGET = function(url, callback){
        try {
            token = JSON.parse(window.localStorage.getItem(''ssisapp-au'')).token;
        } catch (e) { }
        $ionicLoading.show();
        $http({
            method: ''GET'',
            url: window.global.apiServiceBaseUri + ''api/'' + url,
            headers: {''Authorization'': ''Bearer '' + token},
        }).then(function success(res) {
            callback(res.data);
            $ionicLoading.hide();
        }, function error(res) {
            $ionicLoading.hide();
            if (res.status == 401) $state.go(''app.auth'');
            else try { alert(res.data.Message); } catch(e) { alert(res.statusText); }
        });
    };
    var apiPOST = function(url, callback, data){
        try {
            token = JSON.parse(window.localStorage.getItem(''ssisapp-au'')).token;
        } catch (e) { }
        $ionicLoading.show();
        $http({
            method: ''POST'',
            url: window.global.apiServiceBaseUri + ''api/'' + url,
            headers: {''Authorization'': ''Bearer '' + token},
            data: data
        }).then(function success(res) {
            callback(res.data);
            $ionicLoading.hide();
        }, function error(res) {
            $ionicLoading.hide();
            if (res.status == 401) $state.go(''app.auth'');
            else try { alert(res.data.Message); } catch(e) { alert(res.statusText); }
        });
    };

    return {
    
// DataServices
    }
})')
GO
INSERT [dbo].[Templates_tb] ([Template_Name], [Template_Content]) VALUES (N'app_js_menu', N'{
            id: 100@Count,
            title: ''@Model_Name'',
            icon: ''ion-cash'',
            state: ''app.Index@Model_Name''
        },')
GO
INSERT [dbo].[Templates_tb] ([Template_Name], [Template_Content]) VALUES (N'app_js_state', N'    .state(''app.@Action_Name@Model_Name'', {
        url: ''/@Action_Name@Model_Name/@Model_Param'',
        views: {
            ''menuContent'': {
                templateUrl: ''templates/admin/@Action_Name@Model_Name.html'',
                controller: ''@Action_Name@Model_NameCtrl''
            }
        }
    })
')
GO
INSERT [dbo].[Templates_tb] ([Template_Name], [Template_Content]) VALUES (N'controller_cs', N'    [RoutePrefix("api/@Model_Name")]
    public class @Model_NameController : ApiController
    {
        private Model1 db = new Model1();
@controller_cs_IndexOwner
@controller_cs_IndexByParent
@controller_cs_IndexSelect
@controller_cs_ReportCreateEdit
@controller_cs_Report
        [Authorize]
        [HttpGet]
        [Route("Details")]
        public IHttpActionResult Details(int? id)
        {
            try
            {
                if (id == null)
                {
                    return Ok(new @Model_Name_Tb() { });
                }
                @Model_Name_Tb @Model_Object = db.@Model_Name_Tb.First(o => o.@Model_Name_id == id);
                if (@Model_Object == null)
                {
                    return Ok(new @Model_Name_Tb() { });
                }
@controller_cs_Details_Scope
@controller_cs_Details_Owner
                return Ok(@Model_Object);
            } catch {
                return BadRequest();
            }
        }
        [Authorize]
        [HttpPost]
        [Route("CreateEdit")]
        public IHttpActionResult CreateEdit(@Model_Name_Tb _t)
        {
            try
            {
                if (_t.@Model_Name_id == 0) {
@controller_cs_CreateEdit_Owner
                    db.@Model_Name_Tb.Add(_t);
                }
                else
                    db.Entry(_t).State = EntityState.Modified;
                db.SaveChanges();
@controller_cs_CreateEdit_Notification
                return Ok(_t);
            } catch { 
                return BadRequest();
            }
        }
    }
')
GO
INSERT [dbo].[Templates_tb] ([Template_Name], [Template_Content]) VALUES (N'controller_cs_CreateEdit_Notification', N'                CommonHelper.Notification_Request("@Model_Name", _t.@Model_Name_id);
')
GO
INSERT [dbo].[Templates_tb] ([Template_Name], [Template_Content]) VALUES (N'controller_cs_CreateEdit_Owner', N'                    _t.@Owner_Column_Name = int.Parse(ClaimsPrincipal.Current.Claims.Where(c => c.Type == "cuser").Single().Value);
')
GO
INSERT [dbo].[Templates_tb] ([Template_Name], [Template_Content]) VALUES (N'controller_cs_Details_Owner', N'                int cuser = int.Parse(ClaimsPrincipal.Current.Claims.Where(c => c.Type == "cuser").Single().Value);
                if (AppInstance.Instance.GetOwner(cuser) != @Model_Object.@Owner_Column_Name) {
                    AppInstance.Instance.SetOwner(cuser, @Model_Object.@Owner_Column_Name);
                }
')
GO
INSERT [dbo].[Templates_tb] ([Template_Name], [Template_Content]) VALUES (N'controller_cs_Details_Scope', N'                int cuser = int.Parse(ClaimsPrincipal.Current.Claims.Where(c => c.Type == "cuser").Single().Value);
                if (AppInstance.Instance.GetScope(cuser) != @Model_Object.@Scope_Column_Name) {
                    AppInstance.Instance.SetScope(cuser, @Model_Object.@Scope_Column_Name);
                }
')
GO
INSERT [dbo].[Templates_tb] ([Template_Name], [Template_Content]) VALUES (N'controller_cs_Index', N'        [Authorize]
        [HttpGet]
        [Route("Index")]
        public IHttpActionResult Index()
        {
            int cuser = int.Parse(ClaimsPrincipal.Current.Claims.Where(c => c.Type == "cuser").Single().Value);
            return Ok(db.@Model_Name_Tb.Where(o => o.@Owner_Column_Name == cuser).ToList());
        }
')
GO
INSERT [dbo].[Templates_tb] ([Template_Name], [Template_Content]) VALUES (N'controller_cs_IndexByParent', N'        [Authorize]
        [HttpGet]
        [Route("IndexByParent")]
        public IHttpActionResult IndexByParent(int? id)
        {
            return Ok(db.@Model_Name_Tb.Where(o => o.@Parent_Name_id == id.Value).ToList());
        }
')
GO
INSERT [dbo].[Templates_tb] ([Template_Name], [Template_Content]) VALUES (N'controller_cs_IndexSelect', N'        [Authorize]
        [HttpGet]
        [Route("IndexSelect")]
        public IHttpActionResult IndexSelect()
        {
            int cuser = int.Parse(ClaimsPrincipal.Current.Claims.Where(c => c.Type == "cuser").Single().Value);
            int scope = AppInstance.Instance.GetScope(cuser);
            return Ok(db.@Model_Name_Tb.Where(o => o.@Scope_Column_Name == scope).Select(o => new { o.@Select_Value, o.@Select_Text}).ToList());
        }
')
GO
INSERT [dbo].[Templates_tb] ([Template_Name], [Template_Content]) VALUES (N'controller_cs_IndexSelect_Owner', N'        [Authorize]
        [HttpGet]
        [Route("IndexSelect")]
        public IHttpActionResult IndexSelect()
        {
            int cuser = int.Parse(ClaimsPrincipal.Current.Claims.Where(c => c.Type == "cuser").Single().Value);
            int owner = AppInstance.Instance.GetOwner(cuser);
            return Ok(db.@Model_Name_Tb.Where(o => o.@Owner_Column_Name == owner).Select(o => new { o.@Select_Value, o.@Select_Text}).ToList());
        }
')
GO
INSERT [dbo].[Templates_tb] ([Template_Name], [Template_Content]) VALUES (N'controller_cs_Report', N'        [Authorize]
        [HttpGet]
        [Route("Report")]
        public IHttpActionResult Report(int? id)
        {
            return Ok(db.@Model_Name_Tb.Where(o => o.@Parent_Name_id == 0).ToList());
        }
')
GO
INSERT [dbo].[Templates_tb] ([Template_Name], [Template_Content]) VALUES (N'controller_cs_ReportCreateEdit', N'        [Authorize]
        [HttpGet]
        [Route("ReportCreateEdit")]
        public IHttpActionResult ReportCreateEdit(ReportModel r)
        {
            return Ok(db.@Model_Name_Tb.@controller_cs_ReportCreateEdit_Condition.ToList());
        }
')
GO
INSERT [dbo].[Templates_tb] ([Template_Name], [Template_Content]) VALUES (N'controller_cs_ReportModel', N'    public class ReportModel
    {
        @controller_cs_ReportCreateEdit_Parameter
    }
')
GO
INSERT [dbo].[Templates_tb] ([Template_Name], [Template_Content]) VALUES (N'controllers_js_CreateEdit', N'    function CreateEdit@Model_NameHandle($scope, $ionicModal, DataServices, $translate) {
        $ionicModal.fromTemplateUrl(''templates/admin/CreateEdit@Model_Name.html'', {
            scope: $scope,
            animation: ''slide-in-up''
        }).then(function(modal) {
            $scope.CreateEdit@Model_NameWnd = modal;
        });
@controllers_js_CreateEdit_Field_Select
        $scope.close@Model_NameWnd = function() {
            $scope.CreateEdit@Model_NameWnd.hide();
        }
        $scope.CreateEdit@Model_Name = function(@Model_Object) {
            $scope.CreateEdit@Model_NameWnd.@Model_Object = @Model_Object || {};
            if ((!$scope.@Model_Object) || ($scope.@Model_Object && !$scope.@Model_Object.@Model_Name_id)) {
                $scope.new@Model_Name = true;
            }
            $scope.CreateEdit@Model_NameWnd.show();
        }
        $scope.save@Model_Name = function() {
@controllers_js_CreateEdit_Field_Parent
            /*if (document.querySelectorAll(".ng-invalid").length > 0) {
                inject("$ionicPopup").alert({
                    title: ''Invalid data'',
                    template: "Please fill in all required fields"
                });
                return;
            }*/
            DataServices.CreateEdit@Model_Name($scope.CreateEdit@Model_NameWnd.@Model_Object,
                function(saved@Model_Name) {
                    // opener == @Model_NamesCtrl
                    if ($scope.@Model_ObjectsByFirstLetter) {
                        $scope.groupByFirstLetter();
                    }
                    // opener != @Model_NameDetailsCtrl => clear FORM (other views call New only, @Model_NameDetailsCtrl call Edit so don''t need clear FORM)
                    if ($scope.new@Model_Name) {
                        $scope.CreateEdit@Model_NameWnd.@Model_Object = undefined;
                    }
                });
            $scope.close@Model_NameWnd();
        }
    }
')
GO
INSERT [dbo].[Templates_tb] ([Template_Name], [Template_Content]) VALUES (N'controllers_js_CreateEdit_Field_Parent', N'            if ($scope.@Parent_Object_id) {
                $scope.CreateEdit@Model_NameWnd.@Model_Object.@Parent_Name_id = parseInt($scope.@Parent_Object_id);
            }
')
GO
INSERT [dbo].[Templates_tb] ([Template_Name], [Template_Content]) VALUES (N'controllers_js_CreateEdit_Field_Select', N'        if (!$scope.@Select_Objects) {
            DataServices.IndexSelect@Select_Name(function(result) { $scope.@Select_Objects = result; });
        }
')
GO
INSERT [dbo].[Templates_tb] ([Template_Name], [Template_Content]) VALUES (N'controllers_js_Details', N'    app.controller(''Details@Model_NameCtrl'', function($scope, $stateParams, $ionicModal, DataServices, $translate) {
        DataServices.Details@Model_Name($stateParams.@Model_Object_id,
            function(result) {
                if (window.global.CONNECT_MODE == 1)
                    $scope.@Model_Object = result;
                else
                    $scope.@Model_Object = result[0];
@controllers_js_Details_Field_Select
            });
        CreateEdit@Model_NameHandle($scope, $ionicModal, DataServices);
        $scope.fdate = function(sdate) {
            return moment(sdate).format("DD/MM/YYYY HH:mm")
        }
    })
')
GO
INSERT [dbo].[Templates_tb] ([Template_Name], [Template_Content]) VALUES (N'controllers_js_Details_Field_Select', N'                DataServices.Details@Select_Name($scope.@Model_Object.@Select_Value, function(result) { $scope.@Select_Object = result; });')
GO
INSERT [dbo].[Templates_tb] ([Template_Name], [Template_Content]) VALUES (N'controllers_js_Index', N'    app.controller(''Index@Model_NameCtrl'', function($scope, $ionicModal, DataServices, $translate) {
        $scope.bg=function(g){var n=g.toString(),t=n.substring(n.length-1,n.length),r="url(img/bg/"+t+".jpg)";return{"background-image":r}};
        $scope.groupByFirstLetter = 
            function() {
                DataServices.Index@Model_Name(
                    function(result) {
                        $scope.@Model_Objects = result;
                        $scope.firstLetters = [];
                        $scope.@Model_ObjectsByFirstLetter = [];
                        for (var i = 0; i < $scope.@Model_Objects.length; i++) {
                            var @Model_Object = $scope.@Model_Objects[i];
                            var firstLetter = @Model_Object.@Model_Title.substring(0, 1).toUpperCase();
                            if ($scope.firstLetters.indexOf(firstLetter) < 0) {
                                $scope.firstLetters.push(firstLetter);
                            }
                            if (!$scope.@Model_ObjectsByFirstLetter[firstLetter]) {
                                $scope.@Model_ObjectsByFirstLetter[firstLetter] = [];
                            }
                            $scope.@Model_ObjectsByFirstLetter[firstLetter].push(@Model_Object);
                        }
                    }
                );
            };

        $scope.groupByFirstLetter();
        CreateEdit@Model_NameHandle($scope, $ionicModal, DataServices);
    })
')
GO
INSERT [dbo].[Templates_tb] ([Template_Name], [Template_Content]) VALUES (N'controllers_js_IndexByParent', N'    app.controller(''Index@Model_NameBy@Parent_NameCtrl'', function($scope, $stateParams, $ionicModal, DataServices, $translate) {
        $scope.@Parent_Object_id = $stateParams.@Parent_Object_id;
        DataServices.Details@Parent_Name($scope.@Parent_Object_id,
            function(result) {$scope.@Parent_Name = result;}
        );
        $scope.groupByFirstLetter = 
            function() {
                $scope.firstLetters = [];
                $scope.@Model_ObjectsByFirstLetter = [];
                for (var i = 0; i < $scope.@Model_Objects.length; i++) {
                    var @Model_Object = $scope.@Model_Objects[i];
                    var firstLetter = @Model_Object.@Model_Title.substring(0, 1).toUpperCase();
                    if ($scope.firstLetters.indexOf(firstLetter) < 0) {
                        $scope.firstLetters.push(firstLetter);
                    }
                    if (!$scope.@Model_ObjectsByFirstLetter[firstLetter]) {
                        $scope.@Model_ObjectsByFirstLetter[firstLetter] = [];
                    }
                    $scope.@Model_ObjectsByFirstLetter[firstLetter].push(@Model_Object);
                }
            };
        DataServices.Index@Model_NameBy@Parent_Name($scope.@Parent_Object_id,
            function(result) {
                $scope.@Model_Objects = result;
                $scope.groupByFirstLetter();
            }
        );
        CreateEdit@Model_NameHandle($scope, $ionicModal, DataServices);
    })
')
GO
INSERT [dbo].[Templates_tb] ([Template_Name], [Template_Content]) VALUES (N'controllers_js_Report', N'    app.controller(''Report@Model_NameCtrl'', function($scope, $stateParams, $ionicModal, DataServices, $translate) {
        $scope.@Parent_Object_id = $stateParams.@Parent_Object_id;
        DataServices.Details@Parent_Name($scope.@Parent_Object_id,
            function(result) {$scope.@Parent_Name = result;}
        );
        $scope.groupByFirstLetter = 
            function() {
                $scope.firstLetters = [];
                $scope.@Model_ObjectsByFirstLetter = [];
                for (var i = 0; i < $scope.@Model_Objects.length; i++) {
                    var @Model_Object = $scope.@Model_Objects[i];
                    var firstLetter = @Model_Object.@Model_Title.substring(0, 1).toUpperCase();
                    if ($scope.firstLetters.indexOf(firstLetter) < 0) {
                        $scope.firstLetters.push(firstLetter);
                    }
                    if (!$scope.@Model_ObjectsByFirstLetter[firstLetter]) {
                        $scope.@Model_ObjectsByFirstLetter[firstLetter] = [];
                    }
                    $scope.@Model_ObjectsByFirstLetter[firstLetter].push(@Model_Object);
                }
            };
        DataServices.Report@Model_Name($scope.@Parent_Object_id,
            function(result) {
                $scope.@Model_Objects = result;
                $scope.groupByFirstLetter();
            }
        );
        ReportCreateEdit@Model_NameHandle($scope, $ionicModal, DataServices);
    })
')
GO
INSERT [dbo].[Templates_tb] ([Template_Name], [Template_Content]) VALUES (N'controllers_js_ReportCreateEdit', N'    function ReportCreateEdit@Model_NameHandle($scope, $ionicModal, DataServices, $translate) {
        $ionicModal.fromTemplateUrl(''templates/ssis/admin/ReportCreateEdit@Model_Name.html'', {
            scope: $scope,
            animation: ''slide-in-up''
        }).then(function(modal) {
            $scope.ReportCreateEdit@Model_NameWnd = modal;
        });
@controllers_js_ReportCreateEdit_Field_Select
        $scope.closeReport@Model_NameWnd = function() {
            $scope.ReportCreateEdit@Model_NameWnd.hide();
        }
        $scope.ReportCreateEdit@Model_Name = function(@Model_Object) {
            $scope.ReportCreateEdit@Model_NameWnd.@Model_Object = @Model_Object || {};
            if ((!$scope.@Model_Object) || ($scope.@Model_Object && !$scope.@Model_Object.@Model_Name_id)) {
                $scope.newReport@Model_Name = true;
            }
@controllers_js_ReportCreateEdit_Field_Select2
@controllers_js_ReportCreateEdit_Field_Date2
            $scope.ReportCreateEdit@Model_NameWnd.show();
        }
        $scope.saveReport@Model_Name = function() {
@controllers_js_ReportCreateEdit_Field_Parent
            /*if (document.querySelectorAll(".ng-invalid").length > 0) {
                inject("$ionicPopup").alert({
                    title: ''Invalid data'',
                    template: "Please fill in all required fields"
                });
                return;
            }*/
            DataServices.ReportCreateEdit@Model_Name($scope.ReportCreateEdit@Model_NameWnd.@Model_Object,
                function(savedReport@Model_Name) {
                    // opener == @Model_NamesCtrl
                    if ($scope.@Model_Objects) {
                        $scope.@Model_Objects = savedReport@Model_Name;
                    }
                    if ($scope.@Model_ObjectsByFirstLetter) {
                        $scope.groupByFirstLetter();
                    }
                    // opener != @Model_NameDetailsCtrl => clear FORM (other views call New only, @Model_NameDetailsCtrl call Edit so don''t need clear FORM)
                    if ($scope.new@Model_Name) {
                        $scope.ReportCreateEdit@Model_NameWnd.@Model_Object = undefined;
                    }
                });
            $scope.closeReport@Model_NameWnd();
        }
    }
')
GO
INSERT [dbo].[Templates_tb] ([Template_Name], [Template_Content]) VALUES (N'controllers_js_ReportCreateEdit_Field_Date2', N'        $scope.ReportCreateEdit@Model_NameWnd.@Model_Object.@Field_Column_Namef = new Date();
        $scope.ReportCreateEdit@Model_NameWnd.@Model_Object.@Field_Column_Namet = new Date();
')
GO
INSERT [dbo].[Templates_tb] ([Template_Name], [Template_Content]) VALUES (N'controllers_js_ReportCreateEdit_Field_Select', N'        if (!$scope.@Select_Objects) {
            DataServices.IndexSelect@Select_Name(function(result) { $scope.@Select_Objects = result; });
        }
')
GO
INSERT [dbo].[Templates_tb] ([Template_Name], [Template_Content]) VALUES (N'controllers_js_ReportCreateEdit_Field_Select2', N'        $scope.ReportCreateEdit@Model_NameWnd.@Model_Object.@Select_Objects = [];
')
GO
INSERT [dbo].[Templates_tb] ([Template_Name], [Template_Content]) VALUES (N'services_js_DataServices', N'    Index@Model_Name: function(callback) {
        apiGET("SELECT * FROM @Model_Name_Tb", callback);
        //apiGET(''@Model_Name/Index/'', callback);
    },
    Index@Model_NameBy@Parent_Name: function(@Parent_Object_id, callback) {
        apiGET("SELECT * FROM @Model_Name_Tb WHERE @Parent_Name_id=" + @Parent_Object_id, callback);
        //apiGET(''@Model_Name/IndexByParent?id='' + @Parent_Object_id, callback);
    },
    Report@Model_Name: function(@Parent_Object_id, callback) {
        apiGET("SELECT * FROM @Model_Name_Tb WHERE @Parent_Name=" + @Parent_Object_id, callback);
        //apiGET(''@Model_Name/Report?id='' + @Parent_Object_id, callback);
    },
    IndexSelect@Model_Name: function(callback) {
        apiGET("SELECT @Select_Value,@Select_Text FROM @Model_Name_Tb", callback);
        //apiGET(''@Model_Name/IndexSelect/'', callback);
    },
    Details@Model_Name: function(@Model_Object_id, callback) {
        apiPOST("SELECT * FROM @Model_Name_Tb WHERE @Model_Name_id = ?", callback, [parseInt(@Model_Object_id)]);
        //apiGET(''@Model_Name/Details?id='' + @Model_Object_id, callback);
    },
    CreateEdit@Model_Name: function(@Model_Object, callback) {
        if (@Model_Object.@Model_Name_id)
        {
         apiPOST("UPDATE @Model_Name_Tb SET @Model_Name_title=(?) WHERE @Model_Name_id=(?)", callback, [@Model_Object.@Model_Name_title, @Model_Object.@Model_Name_id]);
        }
        else {
         apiPOST("INSERT INTO @Model_Name_Tb (@Model_Name_title, @Model_Name_id) VALUES (?,?)", callback, [@Model_Object.@Model_Name_title, 1]);
        }
        //apiPOST(''@Model_Name/CreateEdit/'', callback, @Model_Object);
    },
    ReportCreateEdit@Model_Name: function(@Model_Object, callback) {
        apiPOST(''@Model_Name/ReportCreateEdit/'', callback, @Model_Object);
    },
')
GO
INSERT [dbo].[Templates_tb] ([Template_Name], [Template_Content]) VALUES (N'templates_html_CreateEdit', N'// CreateEdit@Model_Name.html
<ion-modal-view>
	<ion-header-bar class="bar-dark">
    <button class="button button-clear" ng-click="close@Model_NameWnd()"><i class="icon ion-ios-close-outline"></i></button>
	  <h1 class="title">{{new@Model_Name ? "CREATE" : "EDIT" | translate}} {{''@Model_Display_Name'' | translate}}</h1>
    <div class="buttons">
      <button class="button button-clear" ng-click="save@Model_Name()"><i class="icon ion-checkmark-circled"></i></button>
    </div>
	</ion-header-bar>
  <ion-content>
  <form name="CreateEdit@Model_NameForm">
    <div class="list padding card">
    	<div class="item item-input">
              <span class="invalid-input" ng-if="!CreateEdit@Model_NameWnd.@Model_Object.@Model_Title"></span>
    		  <input type="text" ng-required="true" ng-model="CreateEdit@Model_NameWnd.@Model_Object.@Model_Title" placeholder="@Model_Name {{ ''@Model_Display_Name'' | translate }}"/>
    	</div>
    	
        <div class="item item-divider">{{ ''Infomation'' | translate }}</div>
@templates_html_CreateEdit_Columns

     	<div class="padding">
    		<button class="button button-dark button-block" ng-click="save@Model_Name()">{{ ''Save'' | translate }}</button>
    	</div>
   	</div>
  </form>

  </ion-content>
</ion-modal-view>
')
GO
INSERT [dbo].[Templates_tb] ([Template_Name], [Template_Content]) VALUES (N'templates_html_CreateEdit_Columns', N'    	<label class="item item-input item-floating-label" style="@Field_Hidden">
			{{ ''@Field_Display_Name'' | translate }}:
    		<input class="form-control" type="@Field_Use_Type" ng-model="CreateEdit@Model_NameWnd.@Model_Object.@Field_Column_Name" />
    	</label>
')
GO
INSERT [dbo].[Templates_tb] ([Template_Name], [Template_Content]) VALUES (N'templates_html_CreateEdit_Columns_Select', N'    	<label class="item item-select item-floating-label">
			{{ ''@Field_Display_Name'' | translate }}:
    		<select class="form-control" ng-model="CreateEdit@Model_NameWnd.@Model_Object.@Field_Column_Name" ng-options="@Select_Object.@Select_Value as @Select_Object.@Select_Text for @Select_Object in @Select_Objects | orderBy:''toString()''"></select>
    	</label>
')
GO
INSERT [dbo].[Templates_tb] ([Template_Name], [Template_Content]) VALUES (N'templates_html_CreateEdit_Columns_TextArea', N'    	<label class="item item-input item-floating-label">
			{{ ''@Field_Display_Name'' | translate }}:
    		<textarea autocomplete="off" class="form-control" rows="5" required placeholder="" value="CreateEdit@Model_NameWnd.@Model_Object.@Field_Column_Name" ng-model="CreateEdit@Model_NameWnd.@Model_Object.@Field_Column_Name"></textarea>
    	</label>
')
GO
INSERT [dbo].[Templates_tb] ([Template_Name], [Template_Content]) VALUES (N'templates_html_Details', N'// Details@Model_Name.html
<ion-view view-title="{{''Details'' | translate}} {{ ''@Model_Display_Name'' | translate }}">
    <ion-nav-buttons side="right">
        <button class="button ink button-icon button-clear ion-edit" ng-click="CreateEdit@Model_Name(@Model_Object)"></button>
    </ion-nav-buttons>
	<ion-content class="crud scroll-content ionic-scroll card">
        <div class="padding product">
            <h4 class="title">{{@Model_Object.@Model_Title}}</h4>
    <div class="ecommerce row">
        <ion-scroll direction="x" style="width:100%;">
            <div class="wide">
@templates_html_Details_Childs
            </div>
        </ion-scroll>
    </div>
        </div>
	    <div class="list padding">
            <div class="item item-divider">{{ ''Infomation'' | translate }}</div>
@templates_html_Details_Columns
	    </div>
	</ion-content>
</ion-view>
')
GO
INSERT [dbo].[Templates_tb] ([Template_Name], [Template_Content]) VALUES (N'templates_html_Details_Childs', N'                <div class="box" ui-sref="app.Index@Child_NameBy@Model_Name({@Model_Object_id:@Model_Object.@Model_Name_id})" ng-hide="''''==''@Child_Name''" style="height:60px;width:auto;">
                    <button class="button button-raised button-dark">{{ ''@Child_Display_Name'' | translate }}</button>
                </div>
')
GO
INSERT [dbo].[Templates_tb] ([Template_Name], [Template_Content]) VALUES (N'templates_html_Details_Columns', N'	      <label class="item item-text-wrap" style="@Field_Hidden">
	      {{ ''@Field_Display_Name'' | translate }}: <p class="pull-right" style="display:inline-block;"> {{@Model_Object.@Field_Column_Name}} </p>
	      </label>
')
GO
INSERT [dbo].[Templates_tb] ([Template_Name], [Template_Content]) VALUES (N'templates_html_Index', N'// Index@Model_Name.html
<ion-view view-title="{{ ''@Model_Display_Name'' | translate }}" cache-view="false">
    <ion-nav-buttons side="right">
        <button class="button ink button-icon button-clear ion-plus" ng-click="CreateEdit@Model_Name()"></button>
    </ion-nav-buttons>
    <div class="bar bar-subheader bar-stable item-input">
        <label class="item-input-wrapper light-bg" style1=''box-shadow:0 1px 2px 1px #dddddd;''>
            <input type="text" placeholder="{{ ''Search'' | translate }}"  ng-model="searchText">
        </label>
        <button class="button ink button-icon button-clear icon ion-ios-search">
        
        </button>
    </div>
    <ion-content class="crud scroll-content ionic-scroll has-subheader">
        <div ng-if="!@Model_Objects || @Model_Objects.length==0" class="center">
            <div class="hardware">
                <i class="icon ion-alert"></i>
                <h3>{{ ''Empty'' | translate }}!</h3>
            </div>
        </div>
     	<ion-list can-swipe="true" show-delete="false" show-reorder="false">  
            <div class="item item-divider" ng-repeat-start="firstLetter in firstLetters | orderBy:''toString()''">
            {{firstLetter}}
            </div>
    		<ion-item ng-repeat="@Model_Object in @Model_ObjectsByFirstLetter[firstLetter] | filter:searchText | orderBy:''@Model_Title''" item="item" class="item-remove-animate" ui-sref="app.Details@Model_Name({@Model_Object_id: @Model_Object.@Model_Name_id})">
    			<h2>{{@Model_Object.@Model_Title}}</h2>
    			<h3>{{ ''More'' | translate }}</h3>
    			<ion-option-button class="button-positive" ui-sref="createedit()">
    				{{ ''Edit'' | translate }}
    			</ion-option-button>
    			<ion-option-button class="button-assertive" ng-click="delete()">
                    {{ ''Delete'' | translate }}
        		</ion-option-button>
    		</ion-item>
            <span ng-repeat-end="">
            
            </span>
        </ion-list>
    </ion-content>
</ion-view>
')
GO
INSERT [dbo].[Templates_tb] ([Template_Name], [Template_Content]) VALUES (N'templates_html_Index0', N'// Index@Model_Name.html
<ion-view view-title="{{ ''@Model_Display_Name'' | translate }}" cache-view="false">
    <ion-nav-buttons side="right">
        <button class="button ink button-icon button-clear ion-plus" ng-click="CreateEdit@Model_Name()"></button>
    </ion-nav-buttons>
    <div class="bar bar-subheader bar-stable item-input">
        <label class="item-input-wrapper light-bg" style1=''box-shadow:0 1px 2px 1px #dddddd;''>
            <input type="text" placeholder="{{ ''Search'' | translate }}"  ng-model="searchText">
        </label>
        <button class="button ink button-icon button-clear icon ion-ios-search">
        
        </button>
    </div>
    <ion-content class="newscategory scroll-content ionic-scroll has-subheader">
        <div ng-if="!@Model_Objects || @Model_Objects.length==0" class="center">
            <div class="hardware">
                <i class="icon ion-alert"></i>
                <h3>{{ ''Empty'' | translate }}!</h3>
            </div>
        </div>
        <ion-list can-swipe="true" show-delete="false" show-reorder="false">  
            <div class="item item-divider" ng-repeat-start="firstLetter in firstLetters | orderBy:''toString()''">
            {{firstLetter}}
            </div>
            <div ng-repeat="@Model_Object in @Model_ObjectsByFirstLetter[firstLetter] | filter:searchText | orderBy:''@Model_Title''" class="row">
                <div class="col item card" ng-style="bg(@Model_Object.@Model_Name_id);">
                    <div class="opacity"></div>
                    <div class="box" style="width: 80%;text-align: center;" ui-sref="app.Details@Model_Name({@Model_Object_id: @Model_Object.@Model_Name_id})">
                        <h5>{{@Model_Object.@Model_Title}}</h5>
                    </div>
                </div>
            </div>
            <span ng-repeat-end="">
            
            </span>
        </ion-list>
    </ion-content>
</ion-view>
')
GO
INSERT [dbo].[Templates_tb] ([Template_Name], [Template_Content]) VALUES (N'templates_html_Index1', N'// Index@Model_Name.html
<ion-view view-title="{{ ''@Model_Display_Name'' | translate }}" cache-view="false">
    <ion-nav-buttons side="right">
        <button class="button ink button-icon button-clear ion-plus" ng-click="CreateEdit@Model_Name()"></button>
    </ion-nav-buttons>
    <div class="bar bar-subheader bar-stable item-input">
        <label class="item-input-wrapper light-bg" style1=''box-shadow:0 1px 2px 1px #dddddd;''>
            <input type="text" placeholder="{{ ''Search'' | translate }}"  ng-model="searchText">
        </label>
        <button class="button ink button-icon button-clear icon ion-ios-search">
        
        </button>
    </div>
    <ion-content class="crud scroll-content ionic-scroll has-subheader">
        <div ng-if="!@Model_Objects || @Model_Objects.length==0" class="center">
            <div class="hardware">
                <i class="icon ion-alert"></i>
                <h3>{{ ''Empty'' | translate }}!</h3>
            </div>
        </div>
     	<ion-list can-swipe="true" show-delete="false" show-reorder="false">  
            <div class="item item-divider" ng-repeat-start="firstLetter in firstLetters | orderBy:''toString()''">
            {{firstLetter}}
            </div>
    		<ion-item ng-repeat="@Model_Object in @Model_ObjectsByFirstLetter[firstLetter] | filter:searchText | orderBy:''@Model_Title''" item="item" class="item-remove-animate item-thumbnail-left" ui-sref="app.Details@Model_Name({@Model_Object_id: @Model_Object.@Model_Name_id})">
    			<img ng-src="{{@Model_Object.Image}}">
    			<h2>{{@Model_Object.@Model_Title}}</h2>
    			<h3>{{ ''More'' | translate }}</h3>
    			<ion-option-button class="button-positive" ui-sref="createedit()">
    				{{ ''Edit'' | translate }}
    			</ion-option-button>
    			<ion-option-button class="button-assertive" ng-click="delete()">
                    {{ ''Delete'' | translate }}
        		</ion-option-button>
    		</ion-item>
            <span ng-repeat-end="">
            
            </span>
        </ion-list>
    </ion-content>
</ion-view>')
GO
INSERT [dbo].[Templates_tb] ([Template_Name], [Template_Content]) VALUES (N'templates_html_Report', N'// Report@Model_Name.html
<ion-view view-title="{{ ''@Model_Display_Name'' | translate }}" cache-view="false">
    <ion-nav-buttons side="right">
        <button class="button ink button-icon button-clear ion-plus" ng-click="ReportCreateEdit@Model_Name()"></button>
    </ion-nav-buttons>
    <div class="bar bar-subheader bar-stable item-input">
        <label class="item-input-wrapper light-bg" style1=''box-shadow:0 1px 2px 1px #dddddd;''>
            <input type="text" placeholder="{{ ''Search'' | translate }}"  ng-model="searchText">
        </label>
        <button class="button ink button-icon button-clear icon ion-ios-search">
        
        </button>
    </div>
    <ion-content class="crud scroll-content ionic-scroll has-subheader">
        <div ng-if="!@Model_Objects || @Model_Objects.length==0" class="center">
            <div class="hardware">
                <i class="icon ion-alert"></i>
                <h3>{{ ''Empty'' | translate }}!</h3>
            </div>
        </div>
     	<ion-list can-swipe="true" show-delete="false" show-reorder="false">  
            <div class="item item-divider" ng-repeat-start="firstLetter in firstLetters | orderBy:''toString()''">
            {{firstLetter}}
            </div>
    		<ion-item ng-repeat="@Model_Object in @Model_ObjectsByFirstLetter[firstLetter] | filter:searchText | orderBy:''@Model_Title''" item="item" class="item-remove-animate" ui-sref="app.Details@Model_Name({@Model_Object_id: @Model_Object.@Model_Name_id})">
    			<h2>{{@Model_Object.@Model_Title}}</h2>
    			<h3>{{ ''More'' | translate }}</h3>
    			<ion-option-button class="button-positive" ui-sref="createedit()">
    				{{ ''Edit'' | translate }}
    			</ion-option-button>
    			<ion-option-button class="button-assertive" ng-click="delete()">
                    {{ ''Delete'' | translate }}
        		</ion-option-button>
    		</ion-item>
            <span ng-repeat-end="">
            
            </span>
        </ion-list>
    </ion-content>
</ion-view>
')
GO
INSERT [dbo].[Templates_tb] ([Template_Name], [Template_Content]) VALUES (N'templates_html_ReportCreateEdit', N'// ReportCreateEdit@Model_Name.html
<ion-modal-view>
	<ion-header-bar class="bar-dark">
    <button class="button button-clear" ng-click="closeReport@Model_NameWnd()"><i class="icon ion-ios-close-outline"></i></button>
	  <h1 class="title">{{newReport@Model_Name ? "CREATE" : "EDIT" | translate}} {{''@Model_Display_Name'' | translate}}</h1>
    <div class="buttons">
      <button class="button button-clear" ng-click="saveReport@Model_Name()"><i class="icon ion-checkmark-circled"></i></button>
    </div>
	</ion-header-bar>
  <ion-content>
  <form name="ReportCreateEdit@Model_NameForm">
    <div class="list padding card">
    	<div class="item item-input">
              <span class="invalid-input" ng-if="!ReportCreateEdit@Model_NameWnd.@Model_Object.@Model_Title"></span>
    		  <input type="text" ng-required="true" ng-model="ReportCreateEdit@Model_NameWnd.@Model_Object.@Model_Title" placeholder="@Model_Name {{ ''@Model_Display_Name'' | translate }}"/>
    	</div>
    	
        <div class="item item-divider">{{ ''Infomation'' | translate }}</div>
@templates_html_ReportCreateEdit_Columns

     	<div class="padding">
    		<button class="button button-dark button-block" ng-click="saveReport@Model_Name()">{{ ''Save'' | translate }}</button>
    	</div>
   	</div>
  </form>

  </ion-content>
</ion-modal-view>
')
GO
INSERT [dbo].[Templates_tb] ([Template_Name], [Template_Content]) VALUES (N'templates_html_ReportCreateEdit_Columns_Date', N'        <div class="item item-divider">{{ ''@Field_Display_Name'' | translate }}:</div>
    	<label class="item item-input item-floating-label">
			{{ ''From'' | translate }}:
    		<input class="form-control" type="date" fix-input-date ng-model="ReportCreateEdit@Model_NameWnd.@Model_Object.@Field_Column_Namef" />
    	</label>
    	<label class="item item-input item-floating-label">
			{{ ''To'' | translate }}:
    		<input class="form-control" type="date" fix-input-date ng-model="ReportCreateEdit@Model_NameWnd.@Model_Object.@Field_Column_Namet" />
    	</label>
')
GO
INSERT [dbo].[Templates_tb] ([Template_Name], [Template_Content]) VALUES (N'templates_html_ReportCreateEdit_Columns_Select', N'        <div class="item item-divider">{{ ''@Field_Display_Name'' | translate }}:</div>
    	<ion-list ng-repeat="@Select_Object in @Select_Objects | orderBy:''@Select_Text''">
            <ion-checkbox ng-model="ReportCreateEdit@Model_NameWnd.@Model_Object.@Select_Objects[$index]" ng-true-value="{{ @Select_Object.@Select_Value }}" ng-false-value="{{ 0 - @Select_Object.@Select_Value }}">
                <span>{{ @Select_Object.@Select_Text }}</span>
            </ion-checkbox>
        </ion-list>
        <span ng-repeat="values in ReportCreateEdit@Model_NameWnd.@Model_Object.@Select_Objects">{{values}}</span>
')
GO
