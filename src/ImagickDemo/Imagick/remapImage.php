<?php

namespace ImagickDemo\Imagick;


class remapImage extends \ImagickDemo\Example {

    function getOriginalImage() {
        return $this->control->getURL().'&original=true';
    }


    function renderDescription() {

    }


    function render() {
        return $this->renderImageURL();
    }
}