<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>{$pageTitle}</title>
    
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="/css/bootstrap.css" rel="stylesheet">
    <link href="/css/imagick.css" rel="stylesheet">
    <link href="/css/colpick.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="/css/syntaxhighlighter/shCoreDefault.css">
    <link type="text/css" rel="stylesheet" href="/css/syntaxhighlighter/shThemePHPStormLight.css">
</head>

{inject name='nav' value='ImagickDemo\Navigation\Nav'}

<body>
<header class="navbar navbar-static-top bs-docs-nav" id="top" role="banner">
    <div class="container visible-md visible-lg">
        <nav class="navbar-default " role="navigation">
            <ul class="nav navbar-nav">
                {inject name='navBar' value='ImagickDemo\NavigationBar'}
                {$navBar->render() | nofilter}
        </nav>

        <nav class="navbar-default pull-right" role="navigation">
            <ul class="nav navbar-nav ">
                {$navBar->renderRight() | nofilter}
            </ul>
        </nav>   
    </div>


    <div class="container visible-xs visible-sm">
        {$navBar->renderSelect() | nofilter}
        {$nav->renderSelect() | nofilter}
    </div>
</header>


{inject name='control' value='ImagickDemo\Control'}
{inject name='example' value='ImagickDemo\Example'}
{inject name='docHelper' value='ImagickDemo\DocHelper'}

<div class='container'>

    <div class="row">
        <div class="col-md-5 col-md-offset-3">
            <h4 class='noMarginTop leftShift'>
                {$example->renderTitle() | nofilter}
            </h4>
        </div>
        <div class="col-md-4" style='text-align: right'>
            {$nav->renderPreviousLink() | nofilter}
            {$nav->renderNextLink() | nofilter}
        </div>
    </div>

 
    
    <div class="row">
        
        <div class="col-md-3 visible-md visible-lg navPanel" >
            {$nav->renderNav()}
        </div>

        <div class="col-md-9 leftShift">
            {$docHelper->showDescriptionPanel() | nofilter}
            {$example->renderDescriptionPanel() | nofilter}

            <div class="row">
                <div class="col-md-12 contentPanel" style="padding-top: 10px; padding-bottom: 10px">
                    <table>
                        <tr>
                            <td valign="top" class=''>
                                {$example->render() | nofilter}
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td valign="top" class="formContainer">
                                {$control->renderForm() | nofilter}
                            </td>
                        </tr>
                    </table>
                </div>
            </div>

            
            {$docHelper->showParametersPanel() | nofilter}
            
            
            {$docHelper->showExamples() | nofilter}
            
            {inject name='banner' value='ImagickDemo\Banners\Banner'}

            <div class="row">
                <div class="col-md-12">
                    {$banner->render() | nofilter}
                </div>
            </div>
            
        </div>
    </div>
    
    
    
    
    
    <!-- 
    
    
    <div class="row">

        <div class="col-md-10" >
            <div class="row" style='padding-bottom: 20px'>
                <div class="col-md-8">
                    <h4 class='noMarginTop'>{$example->renderTitle() | nofilter}</h4>

                    <span class='visible-md visible-lg' >

                        <p>
                            {$example->renderDescription() | nofilter}
                        </p>
                    </span>
                </div>
                <div class="col-md-4 visible-md visible-lg" style='text-align: right'>
                    
                    {*$control->renderForm() | nofilter *}
                </div>
            </div>

            <div class="row">
                
            </div>

            <div class='visible-md visible-lg' style="padding-top: 30px">
            </div>
                
            
            <div class="row">
                <div class="col-md-12">
                    
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <span class='visible-xs visible-sm' >
                        <i>{$docHelper->showDescription() | nofilter}</i>
                    </span>
                    <span class='visible-md visible-lg' >
                         {$docHelper->showParameters() | nofilter}
                    </span>
                    {$docHelper->showExamples() | nofilter}
                </div>
            </div>

          
        </div>
    </div>

    <div class="row visible-xs visible-sm">
        <div class="col-md-12">
            {$navBar->renderIssueLink() | nofilter}
        </div>
    </div> 
    
    -->
    
    <div>
        <?php
        echo "<br/><br/><br/><span style='font-size: 8px; display: block;'>Peak memory ". number_format(memory_get_peak_usage())." - <a href='/info'>Status</a> </span>";
        ?> 
    </div>
</div>

</body>

<script src="/js/jquery-1.11.0.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/colpick.js"></script>
<script type="text/javascript" src="/js/syntaxhighlighter/xregexp.js"></script>
<script type="text/javascript" src="/js/syntaxhighlighter/shCore.js"></script>
<script type="text/javascript" src="/js/syntaxhighlighter/shBrushPhp.js"></script>
<script type="text/javascript" src="/js/syntaxhighlighter/shBrushJScript.js"></script>


<script type="text/javascript">
    
    //http://colpick.com/plugin - I love you color picker

    function addColorSelector(selector, targetElement) {
    
        var params = {
            colorScheme:'dark',
            layout:'rgbhex',
            color:'ff8800',
            submit: false,
            onChange:function(hsb, hex, rgb, el) {
                $(el).children().css('background-color', '#' + hex);
                $(targetElement).val("rgb("+ rgb.r + ", " + rgb.g + ", " + rgb.b + ")")
            },
        };

        var startColor = $(selector).data('color');

        if (startColor !== undefined) {
            params.color = startColor;
        }

        $(selector).colpick(params);
    }

    //These are currently hardcoded - todo add JS page injection.
    addColorSelector("#backgroundColorSelector", "#backgroundColor");
    addColorSelector("#colorSelector", "#color");
    addColorSelector("#strokeColorSelector", "#strokeColor");
    addColorSelector("#targetColorSelector", "#targetColor");
    addColorSelector("#fillColorSelector", "#fillColor");
    addColorSelector("#fillModifiedColorSelector", "#fillModifiedColor");
    addColorSelector("#textUnderColorSelector", "#textUnderColor");
    addColorSelector("#gradientStartColorSelector", "#gradientStartColor");
    addColorSelector("#gradientEndColorSelector", "#gradientEndColor");
    addColorSelector("#thresholdColorSelector", "#thresholdColor"); 

    {literal}
    
   
    var params = {
        links: {
            raw: 'Raw text',
            github: 'View on github'
        },
    };

    SyntaxHighlighter.all(params);

    {/literal}
</script>






</html>
