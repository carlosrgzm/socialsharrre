{*
* 2007-2012 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2012 PrestaShop SA

*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

<li id="left_sharrre">
    <div id="facebook"></div>
    <div id="twitter"></div>
    <div id="googlePlus"></div>
    <div id="pinterest"></div>

    <script>

        $('#twitter').sharrre({
            share: {
                twitter: true
            },
            title: ' ',
            url: document.location.href,
            enableHover: false,
            enableTracking: true,
            click: function (element, options) {
                window.open("https://twitter.com/intent/tweet?text={$product_title}&url=" + encodeURIComponent(options.url), "",
                        "toolbar=0, status=0, width=650, height=360");
            },
            render: function (element, options) {
                $(element).find('.count').append('<div class="tooltip-pointer"><div class="inner"></div></div>');
            }
        });

        $('#facebook').sharrre({
            share: {
                facebook: true
            },
            title: ' ',
            url: document.location.href,
            enableHover: false,
            enableTracking: true,
            click: function (element, options) {
                window.open("http://www.facebook.com/sharer.php?u=" + encodeURIComponent(options.url) + "&t={$product_title}",
                        "", "toolbar=0, status=0, width=900, height=500");
            }
        });

        $('#googlePlus').sharrre({
            share: {
                googlePlus: true
            },
            title: ' ',
            url: document.location.href,
            enableHover: false,
            enableTracking: true,
            click: function (element, options) {
                window.open("https://plusone.google.com/_/+1/confirm?hl=es&url=" + encodeURIComponent(options.url), "",
                        "toolbar=0, status=0, width=900, height=500");
            }
        });

        $('#pinterest').sharrre({
            share: {
                pinterest: true
            },
            title: ' ',
            url: document.location.href,
            enableHover: false,
            enableTracking: true,
            click: function (element, options) {

                window.open("http://pinterest.com/pin/create/button/?url=" + encodeURIComponent(options.url) +
                        "&media={$imageLink}&description={$product_title}", "", "toolbar=0, status=0, " +
                        "width=900, height=500");

            }
        });

    </script>
</li>