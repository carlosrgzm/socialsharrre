<?php
if (!defined('_PS_VERSION_')) {
    exit;
}

class socialsharrre extends Module
{
    public function __construct()
    {
        $this->name = 'socialsharrre';
        $this->tab = 'social_networks';
        $this->version = '1.0';
        $this->author = 'Carlos Rodriguez';
        $this->need_instance = 0;
        $this->ps_versions_compliancy = array('min' => '1.5', 'max' => '1.5.3.2');

        parent::__construct();

        $this->displayName = $this->l('Sharre module');
        $this->description = $this->l('Share your products at social networks.');

        $this->confirmUninstall = $this->l('Are you sure you want to uninstall?');

        if (!Configuration::get('socialsharrre')) {
            $this->warning = $this->l('No name provided');
        }
    }

    /**
     * @return mixed
     */
    public function install()
    {
        return (parent::install() AND $this->registerHook('extraLeft'));
    }

    /**
     * @return bool
     */
    public function uninstall()
    {
        if (!parent::uninstall() ||
            !Configuration::deleteByName('socialsharrre')
        ) {
            return false;
        }
        return true;
    }

    /**
     * @param $params
     * @return string
     */
    public function hookExtraLeft($params)
    {
        global $smarty, $cookie, $link;

        $id_product = Tools::getValue('id_product');
        $this->getImagesProduct($smarty, $id_product);

        if (isset($id_product) && $id_product != '') {
            $product_infos = new Product((int)$id_product, true, $cookie->id_lang);
            $smarty->assign(
                array(
                    'product_link' => urlencode($link->getProductLink($product_infos)),
                    'product_title' => urlencode($product_infos->name),
                )
            );
            $this->context->controller->addJS($this->_path . 'jquery.sharrre.js');
            $this->context->controller->addCSS($this->_path . 'socialsharrre.css', 'all');
            return $this->display(__FILE__, 'socialsharrre.tpl');
        } else {
            return '';
        }
    }

    /**
     * Function to obtain product images to pinterest
     * @param $smarty
     * @param int $idProduct
     * @return void
     */
    public function getImagesProduct($smarty, $idProduct)
    {
        global $cookie, $link;
        /* Product informations */
        $product = new Product($idProduct);
        $productLink = $link->getProductLink($product);

        /* Image */
        $images = $product->getImages((int)$cookie->id_lang);

        foreach ($images AS $k => $image) {
            if ($image['cover']) {
                $cover['id_image'] = (int)$product->id . '-' . (int)$image['id_image'];
                $cover['legend'] = $image['legend'];
            }
        }

        if (!isset($cover)) {
            $cover = array(
                'id_image' => Language::getIsoById((int)$cookie->id_lang) . '-default',
                'legend' => 'No picture'
            );
        }

        $imageLink = $link->getImageLink($productLink, $cover['id_image']);

        $smarty->assign(
            array(
                'imageLink' => $imageLink,
            )
        );
    }

}