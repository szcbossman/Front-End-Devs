
/*global angular */
var app = angular.module("data", ['angularUtils.directives.dirPagination', 'ngAnimate']);
app.controller("dataCtrl", function ($scope, $http) {
    $scope.sortType = 'state_name';
    $scope.sortTypeSec = 'last_name';
    $scope.sortTypeThird = 'committee_id';

    $scope.legFav = JSON.parse(localStorage.getItem('legFav'));
    $scope.bilFav = JSON.parse(localStorage.getItem('bilFav'));
    $scope.comFav = JSON.parse(localStorage.getItem('comFav'));


    $scope.isSelectedLeg = function(bioID) {
    	if(JSON.parse(localStorage.getItem('legFav')) == undefined) {
    		localStorage.setItem('legFav', JSON.stringify({}));
    		return false;
    	}
    	else {
    		var legFav = JSON.parse(localStorage.getItem('legFav'));
    		//console.log($scope.legFav);
    		if(legFav[bioID] == undefined) {
    			return false;
    		}
    		else {
    			return true;
    		}
    	}
    	
    }

    $scope.isSelectedBil = function(bilID) {
    	if(JSON.parse(localStorage.getItem('bilFav')) == undefined) {
    		localStorage.setItem('bilFav', JSON.stringify({}));
    		return false;
    	}
    	else {
    		var bilFav = JSON.parse(localStorage.getItem('bilFav'));
    		//console.log($scope.legFav);
    		if(bilFav[bilID] == undefined) {
    			return false;
    		}
    		else {
    			return true;
    		}
    	}
    	
    }

    $scope.isSelectedCom = function(comID) {
    	if(JSON.parse(localStorage.getItem('comFav')) == undefined) {
    		localStorage.setItem('comFav', JSON.stringify({}));
    		return false;
    	}
    	else {
    		var comFav = JSON.parse(localStorage.getItem('comFav'));
    		//console.log($scope.legFav);
    		if(comFav[comID] == undefined) {
    			return false;
    		}
    		else {
    			return true;
    		}
    	}
    	
    }

    $scope.addLegFav = function(bioID, legOBJ) {
    	var legFav = JSON.parse(localStorage.getItem('legFav'));
    	legFav[bioID] = legOBJ;
    	localStorage.setItem('legFav', JSON.stringify(legFav));
    	$scope.legFav = legFav;
    	console.log(JSON.parse(localStorage.getItem('legFav')));
    	//console.log(localStorage.setItem('legFav', JSON.stringify($scope.legFav)));
    }

    $scope.deleteLegFav = function(bioID) {
    	var legFav = JSON.parse(localStorage.getItem('legFav'));
    	delete legFav[bioID];
    	localStorage.setItem('legFav', JSON.stringify(legFav));
    	$scope.legFav = legFav;
    	console.log(JSON.parse(localStorage.getItem('legFav')));
    	//console.log(localStorage.setItem('legFav', JSON.stringify($scope.legFav)));
    }

    
    $scope.addBilFav = function(bilID, bilOBJ) {
    	var bilFav = JSON.parse(localStorage.getItem('bilFav'));
    	bilFav[bilID] = bilOBJ;
    	localStorage.setItem('bilFav', JSON.stringify(bilFav));
    	$scope.bilFav = bilFav;
    	console.log(JSON.parse(localStorage.getItem('bilFav')));
    }

    $scope.deleteBilFav = function(bilID) {
    	var bilFav = JSON.parse(localStorage.getItem('bilFav'));
    	delete bilFav[bilID];
    	localStorage.setItem('bilFav', JSON.stringify(bilFav));
    	$scope.bilFav = bilFav;
    	console.log(JSON.parse(localStorage.getItem('bilFav')));
    }
    
    $scope.addComFav = function(comID, comOBJ) {
    	var comFav = JSON.parse(localStorage.getItem('comFav'));
    	comFav[comID] = comOBJ;
    	localStorage.setItem('comFav', JSON.stringify(comFav));
    	$scope.comFav = comFav;
    	console.log(JSON.parse(localStorage.getItem('comFav')));
    }

    $scope.deleteComFav = function(comID) {
    	var comFav = JSON.parse(localStorage.getItem('comFav'));
    	delete comFav[comID];
    	localStorage.setItem('comFav', JSON.stringify(comFav));
    	$scope.comFav = comFav;
    	console.log(JSON.parse(localStorage.getItem('comFav')));
    }
    
    
    $scope.legSec = true;
    $scope.bilSec = false;
    $scope.comSec = false;
    $scope.favSec = false;
    $scope.LegSection = function() {
    	$scope.legSec = true;
    	$scope.bilSec = false;
    	$scope.comSec = false;
    	$scope.favSec = false;
    }
    $scope.BilSection = function() {
    	$scope.legSec = false;
    	$scope.bilSec = true;
    	$scope.comSec = false;
    	$scope.favSec = false;
    }
    $scope.ComSection = function() {
    	$scope.legSec = false;
    	$scope.bilSec = false;
    	$scope.comSec = true;
    	$scope.favSec = false;
    }
    $scope.FavSection = function() {
    	$scope.legSec = false;
    	$scope.bilSec = false;
    	$scope.comSec = false;
    	$scope.favSec = true;
    }
    $scope.legDisplay = function() {
    	return $scope.legSec;
    }
    $scope.bilDisplay = function() {
    	return $scope.bilSec;
    }
    $scope.comDisplay = function() {
    	return $scope.comSec;
    }
    $scope.favDisplay = function() {
    	return $scope.favSec;
    }

    $scope.options = [{label: "Alabama", value: "Alabama"},
                      {label: "Alaska", value: "Alaska"},
                      {label: "American Samoa", value: "American Samoa"},
                      {label: "Arizona", value: "Arizona"},
                      {label: "Arkansas", value: "Arkansas"},
                      {label: "California", value: "California"},
                      {label: "Colorado", value: "Colorado"},
                      {label: "Connecticut", value: "Connecticut"},
                      {label: "Delaware", value: "Delaware"},
                      {label: "District of Columbia", value: "District of Columbia"},
                      {label: "Florida", value: "Florida"},
                      {label: "Georgia", value: "Georgia"},
                      {label: "Guam", value: "Guam"},
                      {label: "Hawaii", value: "Hawaii"},
                      {label: "Idaho", value: "Idaho"},
                      {label: "Illinois", value: "Illinois"},
                      {label: "Indiana", value: "Indiana"},
                      {label: "Iowa", value: "Iowa"},
                      {label: "Kansas", value: "Kansas"},
                      {label: "Kentucky", value: "Kentucky"},
                      {label: "Louisiana", value: "Louisiana"},
                      {label: "maine", value: "maine"},
                      {label: "Maryland", value: "Maryland"},
                      {label: "Massachusetts", value: "Massachusetts"},
                      {label: "Michigan", value: "Michigan"},
                      {label: "Minnesota", value: "Minnesota"},
                      {label: "Mississippi", value: "Mississippi"},
                      {label: "Missouri", value: "Missouri"},
                      {label: "Montana", value: "Montana"},
                      {label: "Nebraska", value: "Nebraska"},
                      {label: "Nevada", value: "Nevada"},
                      {label: "New Hampshire", value: "New Hampshire"},
                      {label: "New Jersey", value: "New Jersey"},
                      {label: "New Mexico", value: "New Mexico"},
                      {label: "New York", value: "New York"},
                      {label: "North Carolina", value: "North Carolina"},
                      {label: "North Dakota", value: "North Dakota"},
                      {label: "Northern Mariana Islands", value: "Northern Mariana Islands"},
                      {label: "Ohio", value: "Ohio"},
                      {label: "Oklahoma", value: "Oklahoma"},
                      {label: "Oregon", value: "Oregon"},
                      {label: "Pennsylvania", value: "Pennsylvania"},
                      {label: "Puerto Rico", value: "Puerto Rico"},
                      {label: "Rhode Island", value: "Rhode Island"},
                      {label: "South Carolina", value: "South Carolina"},
                      {label: "South Dakota", value: "South Dakota"},
                      {label: "Tennessee", value: "Tennessee"},
                      {label: "Texas", value: "Texas"},
                      {label: "US Virgin Islands", value: "US Virgin Islands"},
                      {label: "Utah", value: "Utah"},
                      {label: "Vermont", value: "Vermont"},
                      {label: "Virginia", value: "Virginia"},
                      {label: "Washington", value: "Washington"},
                      {label: "West Virginia", value: "West Virginia"},
                      {label: "Wisconsin", value: "Wisconsin"},
                      {label: "Wyoming", value: "Wyoming"}];
    
    $http.get('http://localhost/~TroyShepardSZC/hw8.php?legislators').then(function (response) {
        //$scope.total = response.data.length;
        $scope.legislators = response.data.results;
        console.log($scope.legislators);
    });

    $http.get('http://localhost/~TroyShepardSZC/hw8.php?billsActive').then(function (response) {
        $scope.billsActive = response.data.results;
        console.log($scope.billsActive);
    });

    $http.get('http://localhost/~TroyShepardSZC/hw8.php?billsNew').then(function (response) {
        $scope.billsNew = response.data.results;
        console.log($scope.billsNew);
    });

    $http.get('http://localhost/~TroyShepardSZC/hw8.php?committees').then(function (response) {
        $scope.committees = response.data.results;
        console.log($scope.committees);
    });

    $scope.legViewDetails = function(legID) {
    	$scope.legSec = true;
    	$scope.bilSec = false;
    	$scope.comSec = false;
    	$scope.favSec = false;


    	var config_0 = {
    		params: {
    			leg:legID,
    			bio_id: legID
    		}
    	}
    	var config_1 = {
    		params: {
    			legbil:legID,
    			bio_id: legID
    		}
    	}
    	var config_2 = {
    		params: {
    			legcom:legID,
    			bio_id: legID
    		}
    	}
    	$http.get('http://localhost/~TroyShepardSZC/hw8.php?', config_0).then(function (response) {
        $scope.legislator = response.data.results;
        console.log($scope.legislator);
        $scope.startTime = new Date($scope.legislator[0].term_start);
    	$scope.endTime = new Date($scope.legislator[0].term_end);
    	$scope.timeNow = new Date();
    	$scope.timeDiffNum = ($scope.timeNow-$scope.startTime);
    	$scope.timeDiffDen = ($scope.endTime-$scope.startTime);
    	$scope.timeDiffPercent = parseInt(($scope.timeDiffNum/$scope.timeDiffDen)*100);
		var percent = $scope.timeDiffPercent + '%';
		console.log(percent);
		$scope.myStyle = {
			"width" : percent  
		}
    	});
    	$http.get('http://localhost/~TroyShepardSZC/hw8.php?', config_2).then(function (response) {
        $scope.legCommittee = response.data.results;
        console.log($scope.legCommittee);
    	});
    	$http.get('http://localhost/~TroyShepardSZC/hw8.php?', config_1).then(function (response) {
        $scope.legBill = response.data.results;
        console.log($scope.legBill);
    	});	
    }

    $scope.billViewDetails = function(billID) {
    	$scope.legSec = false;
    	$scope.bilSec = true;
    	$scope.comSec = false;
    	$scope.favSec = false;

    	var config = {
    		params: {
    			bil: billID,
    			bill_id: billID
    		}
    	}
    $http.get('http://localhost/~TroyShepardSZC/hw8.php?', config).then(function (response) {
        $scope.bill = response.data.results;
        console.log($scope.bill);
    	});	
    }
    

});

app.filter('partyIcon',function() {
	return function(partyLetter) {
		if(partyLetter == 'R') {
			return 'Logos/r.png';
		}
		else if(partyLetter == 'D') {
			return 'Logos/d.png';
		}
		else if(partyLetter == 'I') {
			return 'Logos/i.png';
		}
	}
})

app.filter('chamberIcon', function() {
	return function(chamberLetter) {
		if(chamberLetter == 'house') {
			return 'Logos/h.png';
		}
		else if(chamberLetter == 'senate') {
			return 'Logos/s.svg';
		}
		else if(chamberLetter == 'joint') {
			return 'Logos/s.svg';
		}
	}
})

app.filter('convertDis', function() {
	return function(districtLetter) {
		if(districtLetter != null) {
			return 'District ' + districtLetter;
		}
		else {
			return 'N.A.';
		}
	}
})

app.filter('convertParentCom', function() {
	return function(parentComLetter) {
		if(parentComLetter != null) {
			return parentComLetter;
		}
		else {
			return 'N.A.';
		}
	}
})

app.filter('convertOffice', function() {
	return function(officeLetter) {
		if(officeLetter != null) {
			return officeLetter;
		}
		else {
			return 'N.A.';
		}
	}
})

app.filter('convertParty',function() {
	return function(partyLetter) {
		if(partyLetter == 'R') {
			return 'Republican';
		}
		else if(partyLetter == 'D') {
			return 'Democrat';
		}
		else if(partyLetter == 'I') {
			return 'Independent Party';
		}
	}
})

app.filter('convertActive',function() {
	return function(activeLetter) {
		if(activeLetter == 'true' ) {
			return 'Active';
		}
		else {
			return 'New';
		}
	}
})

app.filter('genTwi',function() {
	return function(twiLetter) {
		if(twiLetter != null ) {
			return 'Logos/t.png';
		}
		else {
			return '';
		}
	}
})

app.filter('genFac',function() {
	return function(facLetter) {
		if(facLetter != null ) {
			return 'Logos/f.png';
		}
		else {
			return '';
		}
	}
})

app.filter('genWeb',function() {
	return function(webLetter) {
		if(webLetter != null ) {
			return 'Logos/w.png';
		}
		else {
			return '';
		}
	}
})


