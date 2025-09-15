/// <reference path="jquery-1.7.2.js" />
    function onlyNumber(textbox) {
        $(textbox).keydown(function (event) {
                if (event.keyCode == 46 || event.keyCode == 8
                    || event.keyCode == 9
                        || (event.keyCode >= 48 && event.keyCode <= 57)
                            || (event.keyCode >= 96 && event.keyCode <= 105)
                                || event.keyCode == 190
                                    || (event.keyCode >= 37 && event.keyCode <= 40)) {
                    // let it happen, don't do anything
                }
                else {
                    event.preventDefault();
                }
            });
    }
            