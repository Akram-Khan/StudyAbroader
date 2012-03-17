$(document).ready(function(){
$('select#first').change(function(e){
    var newOptions = getNewOptions($(this).val());
    $('select#second').html('')   // clear the existing options
    $.each(newOptions,function(i,o){
        $('<option>' + o + '</option>').appendTo('select#second');
    });            
});

function getNewOptions(val){
    if (val == 'asia')
        return [
                ["Afghanistan"],
                ["Armenia" ],
                ["Azerbaijan"],
                ["Bahrain"],
                ["Bangladesh"],
                ["Bhutan"],
                ["British Indian Ocean Territory"],
                ["Brunei Darussalam"],
                ["China"],
                ["Christmas Island"],
                ["Cocos (Keeling) Islands"],
                ["Cyprus"],
                ["Georgia" ],
                ["Hong Kong"],
                ["India"],
                ["Indonesia"],
                ["Iran"],
                ["Iraq"],
                ["Israel"],
                ["Japan"],
                ["Jordan" ],
                ["Kazakhstan"],
                ["Korea (North)"],
                ["Korea (South)"],
                ["Kuwait"],
                ["Kyrgyzstan"],
                ["Laos"],
                ["Lebanon"],
                ["Macao" ],
                ["Malaysia"],
                ["Maldives" ],
                ["Mongolia"],
                ["Myanmar"],
                ["Nepal" ],
                ["Pakistan"],
                ["Palestinian Territory"],
                ["Philippines"],
                ["Qatar"],
                ["Saudi Arabia"],
                ["Singapore"],
                ["Sri Lanka"],
                ["Syrian Arab Republic"],
                ["Taiwan"],
                ["Tajikistan"],
                ["Thailand"],
                ["Timor-Leste"],
                ["Turkey"],
                ["Turkmenistan"],
                ["United Arab Emirates"],
                ["Uzbekistan"],
                ["Viet Nam"],
                ["Yemen"]
            ];

    if(val == 'north_america')
        return [
                ["Anguilla"],
                ["Antigua And Barbuda"],
                ["Aruba"],
                ["Bahamas"],
                ["Belize" ],
                ["Bermuda"],
                ["Bolivia"],
                ["Canada" ],
                ["Cayman Islands"],
                ["Costa Rica"],
                ["Cuba" ],
                ["Dominica" ],
                ["Dominican Republic" ],
                ["El Salvador"],
                ["Greenland"],
                ["Grenada"],
                ["Guadeloupe" ],
                ["Guatemala"],
                ["Haiti"],
                ["Honduras" ],
                ["Jamaica"],
                ["Martinique" ],
                ["Mexico" ],
                ["Montserrat" ],
                ["Netherlands Antilles"],
                ["Nicaragua"],
                ["Panama"],
                ["Puerto Rico"],
                ["Saint Barthelemy" ],
                ["Saint Kitts And Nevis"],
                ["Saint Lucia"],
                ["Saint Martin"],
                ["Saint Pierre And Miquelon"],
                ["Saint Vincent And The Grenadines"],
                ["Trinidad And Tobago"],
                ["Turks And Caicos Islands"],
                ["United States"],
                ["United States Minor Outlying Islands"],
                ["Virgin Islands (British)"],
                ["Virgin Islands (U.S.)"]
            ];

    if(val == 'south_america')
        return [
                ["Argentina"],
                ["Barbados"],
                ["Brazil"],
                ["Chile"],
                ["Colombia"],
                ["Ecuador"],
                ["Falkland Islands (Malvinas)"],
                ["French Guiana"],
                ["Guyana"],
                ["Paraguay"],
                ["Peru"],
                ["Suriname"],
                ["Uruguay"],
                ["Venezuela"]
            ];

    if(val == 'australia')
        return [
                ["American Samoa"],
                ["Australia"],
                ["Cook Islands"],
                ["Fiji"],
                ["French"],
                ["Guam"],
                ["Kiribati" ],
                ["Marshall Islands"],
                ["Micronesia (Federated States Of)"],
                ["Nauru"],
                ["New Caledonia"],
                ["New Zealand"],
                ["Niue"],
                ["Norfolk Island"],
                ["Northern Mariana Islands"],
                ["Palau"],
                ["Papua New Guinea"],
                ["Pitcairn"],
                ["Samoa"],
                ["Solomon Islands"],
                ["Tokelau"],
                ["Tonga"],
                ["Tuvalu"],
                ["Vanuatu"],
                ["Wallis And Futuna"]
            ];

    if(val == 'europe')
        return [
                ["Albania"],
                ["Andorra"],
                ["Austria"],
                ["Belarus"],
                ["Belgium"],
                ["Bosnia And Herzegovina"],
                ["Bulgaria"],
                ["Croatia"],
                ["Czech Republic"],
                ["Denmark"],
                ["Estonia"],
                ["Finland"],
                ["France"],
                ["Faroe Islands"],
                ["Germany"],
                ["Gibraltar"],
                ["Greece"],
                ["Guernsey"],
                ["Hungary"],
                ["Iceland"],
                ["Ireland"],
                ["Isle Of Man"],
                ["Italy"],
                ["Jersey"],
                ["Latvia"],
                ["Liechtenstein"],
                ["Lithuania"],
                ["Luxembourg"],
                ["Macedonia"],
                ["Malta"],
                ["Moldova"],
                ["Monaco"],
                ["Montenegro"],
                ["Netherlands"],
                ["Norway"],
                ["Poland"],
                ["Portugal"],
                ["Romania"],
                ["Russian Federation"],
                ["San Marino"],
                ["Serbia"],
                ["Slovakia"],
                ["Slovenia"],
                ["Spain"],
                ["Svalbard And Jan Mayen"],
                ["Sweden"],
                ["Switzerland"],
                ["Ukraine"],
                ["United Kingdom"],
                ["Vatican City State"]
            ];

    if(val == 'africa')
        return [
                ["Algeria"],
                ["Angola"],
                ["Aland Islands"],
                ["Benin"],
                ["Botswana"],
                ["Burkina Faso"],
                ["Burundi"],
                ["Cambodia"],
                ["Cameroon"],
                ["Cape Verde"],
                ["Central African Republic"],
                ["Chad"],
                ["Comoros"],
                ["Congo"],
                ["Congo (The Democratic Republic)"],
                ["Cote D'Ivoire"],
                ["Djibouti"],
                ["Egypt"],
                ["Equatorial Guinea"],
                ["Eritrea"],
                ["Ethiopia"],
                ["Gabon"],
                ["Gambia"],
                ["Ghana"],
                ["Guinea"],
                ["Guinea-Bissau"],
                ["Kenya"],
                ["Lesotho"],
                ["Liberia"],
                ["Libya"],
                ["Madagascar"],
                ["Malawi"],
                ["Mali"],
                ["Mauritania"],
                ["Mauritius"],
                ["Mayotte"],
                ["Morocco"],
                ["Mozambique"],
                ["Namibia"],
                ["Niger"],
                ["Nigeria"],
                ["Oman"],
                ["Reunion"],
                ["Rwanda"],
                ["Saint Helena"],
                ["Sao Tome And Principe"],
                ["Senegal"],
                ["Seychelles"],
                ["Sierra Leone"],
                ["Somalia"],
                ["South Africa"],
                ["Sudan"],
                ["Swaziland"],
                ["Tanzania"],
                ["Togo"],
                ["Tunisia"],
                ["Uganda"],
                ["Western Sahara"],
                ["Zambia"],
                ["Zimbabwe"]
            ];

    if(val == 'antarctica')
        return[
                ["Antarctica"],
                ["Bouvet Island"],
                ["French Southern Territories"],
                ["Heard And Mcdonald Islands"],
                ["Georgia And Sandwich Islands"]
            ];

}
});