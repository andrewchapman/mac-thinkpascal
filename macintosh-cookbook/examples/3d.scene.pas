<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="utf8"/>
<meta content="width=device-width, initial-scale=1" name="viewport"/>
<title>~the_friar/macintosh-cookbook: examples/3d.scene.pas - sourcehut git</title>
<link href="/static/logo.svg" rel="icon" type="image/svg+xml"/>
<link href="/static/logo.png" rel="icon" sizes="any" type="image/png"/>
<link href="/static/main.min.a7e88522.css" rel="stylesheet"/>
<style>
pre {
  tab-size: 8
}
</style>
<meta content="noindex" name="robots"/>
<meta content="git" name="vcs"/>
<meta content="https://git.sr.ht/~the_friar/macintosh-cookbook" name="vcs:clone"/>
<meta content="git@git.sr.ht:~the_friar/macintosh-cookbook" name="vcs:clone"/>
<meta content="https://git.sr.ht/~the_friar/macintosh-cookbook" name="forge:summary"/>
<meta content="https://git.sr.ht/~the_friar/macintosh-cookbook/tree/{ref}/{path}" name="forge:dir"/>
<meta content="https://git.sr.ht/~the_friar/macintosh-cookbook/tree/{ref}/{path}" name="forge:file"/>
<meta content="https://git.sr.ht/~the_friar/macintosh-cookbook/blob/{ref}/{path}" name="forge:rawfile"/>
<meta content="https://git.sr.ht/~the_friar/macintosh-cookbook/tree/{ref}/{path}#L{line}" name="forge:line"/>
<meta content="git.sr.ht/~the_friar/macintosh-cookbook git https://git.sr.ht/~the_friar/macintosh-cookbook" name="go-import"/>
</head>
<body>
<nav class="navbar navbar-light navbar-expand-sm">
<span class="navbar-brand">
<span aria-hidden="true" class="icon icon-circle"><svg height="22" viewbox="0 0 512 512" width="22" xmlns="http://www.w3.org/2000/svg"><path d="M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8zm0 448c-110.5 0-200-89.5-200-200S145.5 56 256 56s200 89.5 200 200-89.5 200-200 200z"></path></svg>
</span>
<a href="https://sr.ht">
    sourcehut
  </a>
</span>
<ul class="navbar-nav">
<li class="nav-item active">
<a class="nav-link" href="https://git.sr.ht">git</a>
</li>
<li class="nav-item">
<a class="nav-link" href="https://hg.sr.ht">hg</a>
</li>
<li class="nav-item">
<a class="nav-link" href="https://builds.sr.ht">builds</a>
</li>
<li class="nav-item">
<a class="nav-link" href="https://todo.sr.ht">todo</a>
</li>
<li class="nav-item">
<a class="nav-link" href="https://lists.sr.ht">lists</a>
</li>
<li class="nav-item">
<a class="nav-link" href="https://man.sr.ht">man</a>
</li>
<li class="nav-item">
<a class="nav-link" href="https://meta.sr.ht">meta</a>
</li>
</ul>
<div class="login">
<span class="navbar-text">
    Logged in as
    
    
    <a href="https://sr.ht/~the_friar">
    
      the_friar</a>
    —
    <a href="https://meta.sr.ht/logout?return_to=https://git.sr.ht%2F~the_friar%2Fmacintosh-cookbook%2Ftree%2F6824fd50ee1338ef52ff250367b4a81e0e80f830%2Fitem%2Fexamples%2F3d.scene.pas%3F">Log out</a>
</span>
</div>
</nav>
<div class="header-tabbed">
<div class="container-fluid">
<h2>
<a href="/~the_friar/">~the_friar</a>/<wbr/>macintosh-cookbook
    </h2>
<ul class="nav nav-tabs">
<li class="nav-item nav-text vis-unlisted" title="This repository is only visible to those who know the URL.">
        
        Unlisted
        
      </li>
<li class="nav-item">
<a class="nav-link" href="/~the_friar/macintosh-cookbook">summary</a>
</li>
<li class="nav-item">
<a class="nav-link active" href="/~the_friar/macintosh-cookbook/tree">tree</a>
</li>
<li class="nav-item">
<a class="nav-link" href="/~the_friar/macintosh-cookbook/log">log</a>
</li>
<li class="nav-item">
<a class="nav-link" href="/~the_friar/macintosh-cookbook/refs">refs</a>
</li>
<li class="nav-item">
<a class="nav-link" href="/~the_friar/macintosh-cookbook/settings/info">settings</a>
</li>
</ul>
</div>
</div>
<div class="header-extension" style="margin-bottom: 0;">
<div class="blob container-fluid">
<span>
<span style="margin-right: 1rem">
<span class="text-muted">ref:</span> 6824fd50ee1338ef52ff250367b4a81e0e80f830
</span>
<a href="/~the_friar/macintosh-cookbook/tree/6824fd50ee1338ef52ff250367b4a81e0e80f830">macintosh-cookbook</a>/<a href="/~the_friar/macintosh-cookbook/tree/6824fd50ee1338ef52ff250367b4a81e0e80f830/item/examples">examples</a>/3d.scene.pas



  
  
  <span class="text-muted" style="margin-left: 1rem">
<span title="100644">
      -rw-r--r--
    </span>
</span>
<span class="text-muted" style="margin-left: 1rem">
<span title="2116 bytes">
        2.1 KiB
      </span>
</span>
<div class="blob-nav" style="margin-left: 1rem">
<ul class="nav nav-tabs">
<li class="nav-item">
<a class="nav-link active" href="/~the_friar/macintosh-cookbook/tree/6824fd50ee1338ef52ff250367b4a81e0e80f830/item/examples/3d.scene.pas">View</a>
</li>
<li class="nav-item">
<a class="nav-link" href="/~the_friar/macintosh-cookbook/log/6824fd50ee1338ef52ff250367b4a81e0e80f830/item/examples/3d.scene.pas">Log</a>
</li>
<li class="nav-item">
<a class="nav-link" href="/~the_friar/macintosh-cookbook/blame/6824fd50ee1338ef52ff250367b4a81e0e80f830/examples/3d.scene.pas">Blame</a>
</li>
<li class="nav-item">
<a class="nav-link" href="/~the_friar/macintosh-cookbook/blob/6824fd50ee1338ef52ff250367b4a81e0e80f830/examples/3d.scene.pas" rel="noopener noreferrer nofollow">View raw</a>
</li>
<li class="nav-item">
<a class="nav-link" href="/~the_friar/macintosh-cookbook/tree/6824fd50ee1338ef52ff250367b4a81e0e80f830/item/examples/3d.scene.pas">Permalink</a>
</li>
</ul>
</div>
</span>
<div class="commit">
<a href="/~the_friar/macintosh-cookbook/commit/6824fd50ee1338ef52ff250367b4a81e0e80f830">6824fd50</a> —
      
      
      <a href="/~neauoire/">neauoire</a>
      
      Added plane with intersections
      <span class="text-muted">
<span title="2020-05-16 12:37:52 UTC">3 years ago</span>
</span>
</div>
<div class="clearfix"></div>
</div>
</div>
<div class="container-fluid code-viewport">
<div class="row" style="margin-right: 0;">
<div class="col-md-12 code-view">
<pre class="ruler"><span>                                                                                </span></pre>
<pre class="lines"><a href="#L1" id="L1">1</a>
<a href="#L2" id="L2">2</a>
<a href="#L3" id="L3">3</a>
<a href="#L4" id="L4">4</a>
<a href="#L5" id="L5">5</a>
<a href="#L6" id="L6">6</a>
<a href="#L7" id="L7">7</a>
<a href="#L8" id="L8">8</a>
<a href="#L9" id="L9">9</a>
<a href="#L10" id="L10">10</a>
<a href="#L11" id="L11">11</a>
<a href="#L12" id="L12">12</a>
<a href="#L13" id="L13">13</a>
<a href="#L14" id="L14">14</a>
<a href="#L15" id="L15">15</a>
<a href="#L16" id="L16">16</a>
<a href="#L17" id="L17">17</a>
<a href="#L18" id="L18">18</a>
<a href="#L19" id="L19">19</a>
<a href="#L20" id="L20">20</a>
<a href="#L21" id="L21">21</a>
<a href="#L22" id="L22">22</a>
<a href="#L23" id="L23">23</a>
<a href="#L24" id="L24">24</a>
<a href="#L25" id="L25">25</a>
<a href="#L26" id="L26">26</a>
<a href="#L27" id="L27">27</a>
<a href="#L28" id="L28">28</a>
<a href="#L29" id="L29">29</a>
<a href="#L30" id="L30">30</a>
<a href="#L31" id="L31">31</a>
<a href="#L32" id="L32">32</a>
<a href="#L33" id="L33">33</a>
<a href="#L34" id="L34">34</a>
<a href="#L35" id="L35">35</a>
<a href="#L36" id="L36">36</a>
<a href="#L37" id="L37">37</a>
<a href="#L38" id="L38">38</a>
<a href="#L39" id="L39">39</a>
<a href="#L40" id="L40">40</a>
<a href="#L41" id="L41">41</a>
<a href="#L42" id="L42">42</a>
<a href="#L43" id="L43">43</a>
<a href="#L44" id="L44">44</a>
<a href="#L45" id="L45">45</a>
<a href="#L46" id="L46">46</a>
<a href="#L47" id="L47">47</a>
<a href="#L48" id="L48">48</a>
<a href="#L49" id="L49">49</a>
<a href="#L50" id="L50">50</a>
<a href="#L51" id="L51">51</a>
<a href="#L52" id="L52">52</a>
<a href="#L53" id="L53">53</a>
<a href="#L54" id="L54">54</a>
<a href="#L55" id="L55">55</a>
<a href="#L56" id="L56">56</a>
<a href="#L57" id="L57">57</a>
<a href="#L58" id="L58">58</a>
<a href="#L59" id="L59">59</a>
<a href="#L60" id="L60">60</a>
<a href="#L61" id="L61">61</a>
<a href="#L62" id="L62">62</a>
<a href="#L63" id="L63">63</a>
<a href="#L64" id="L64">64</a>
<a href="#L65" id="L65">65</a>
<a href="#L66" id="L66">66</a>
<a href="#L67" id="L67">67</a>
<a href="#L68" id="L68">68</a>
<a href="#L69" id="L69">69</a>
<a href="#L70" id="L70">70</a>
<a href="#L71" id="L71">71</a>
<a href="#L72" id="L72">72</a>
<a href="#L73" id="L73">73</a>
<a href="#L74" id="L74">74</a>
<a href="#L75" id="L75">75</a>
<a href="#L76" id="L76">76</a>
<a href="#L77" id="L77">77</a>
<a href="#L78" id="L78">78</a>
<a href="#L79" id="L79">79</a>
<a href="#L80" id="L80">80</a>
<a href="#L81" id="L81">81</a>
<a href="#L82" id="L82">82</a>
<a href="#L83" id="L83">83</a>
<a href="#L84" id="L84">84</a>
<a href="#L85" id="L85">85</a>
<a href="#L86" id="L86">86</a>
<a href="#L87" id="L87">87</a>
<a href="#L88" id="L88">88</a>
<a href="#L89" id="L89">89</a>
<a href="#L90" id="L90">90</a>
<a href="#L91" id="L91">91</a>
<a href="#L92" id="L92">92</a>
<a href="#L93" id="L93">93</a>
<a href="#L94" id="L94">94</a>
<a href="#L95" id="L95">95</a>
<a href="#L96" id="L96">96</a>
<a href="#L97" id="L97">97</a>
<a href="#L98" id="L98">98</a>
<a href="#L99" id="L99">99</a>
<a href="#L100" id="L100">100</a>
<a href="#L101" id="L101">101</a>
<a href="#L102" id="L102">102</a>
<a href="#L103" id="L103">103</a>
<a href="#L104" id="L104">104</a>
<a href="#L105" id="L105">105</a>
<a href="#L106" id="L106">106</a>
<a href="#L107" id="L107">107</a>
<a href="#L108" id="L108">108</a>
<a href="#L109" id="L109">109</a>
<a href="#L110" id="L110">110</a>
<a href="#L111" id="L111">111</a>
<a href="#L112" id="L112">112</a>
<a href="#L113" id="L113">113</a>
<a href="#L114" id="L114">114</a>
<a href="#L115" id="L115">115</a>
<a href="#L116" id="L116">116</a>
<a href="#L117" id="L117">117</a></pre>
<div class="highlight"><pre><span></span><span class="k">program</span> <span class="n">ExampleScene</span><span class="o">;</span>

 <span class="k">uses</span>
  <span class="n">FixMath</span><span class="o">,</span> <span class="n">Graf3D</span><span class="o">,</span> <span class="n">Graf3DPrimitives</span><span class="o">;</span>

 <span class="k">var</span>
  <span class="n">drawingRect</span><span class="o">:</span> <span class="nb">Rect</span><span class="o">;</span> <span class="cm">{A window Size}</span>
  <span class="n">viewWidth</span><span class="o">,</span> <span class="n">viewHeight</span><span class="o">,</span> <span class="n">padLeft</span><span class="o">,</span> <span class="n">padTop</span><span class="o">:</span> <span class="kt">Integer</span><span class="o">;</span>
  <span class="n">myPort</span><span class="o">:</span> <span class="n">GrafPort</span><span class="o">;</span>
  <span class="n">myPort3D</span><span class="o">:</span> <span class="n">Port3D</span><span class="o">;</span>
  <span class="n">pa</span><span class="o">,</span> <span class="n">pb</span><span class="o">:</span> <span class="n">Point3D</span><span class="o">;</span>
  <span class="n">hangle</span><span class="o">,</span> <span class="n">vangle</span><span class="o">:</span> <span class="kt">Longint</span><span class="o">;</span>
<span class="cm">{cursor}</span>
  <span class="n">cursor</span><span class="o">,</span> <span class="n">prev</span><span class="o">:</span> <span class="n">Point</span><span class="o">;</span>
  <span class="n">isDown</span><span class="o">:</span> <span class="kt">Boolean</span><span class="o">;</span>
<span class="cm">{scene}</span>
  <span class="n">scene</span><span class="o">:</span> <span class="n">Scene3D</span><span class="o">;</span>
  <span class="n">box1</span><span class="o">,</span> <span class="n">wed1</span><span class="o">,</span> <span class="n">pyr1</span><span class="o">:</span> <span class="n">Shape3D</span><span class="o">;</span>

<span class="cm">{&gt;&gt;}</span>
 <span class="k">procedure</span> <span class="nf">ClearScreen</span><span class="o">;</span>
  <span class="k">var</span>
   <span class="n">size</span><span class="o">:</span> <span class="nb">Rect</span><span class="o">;</span>
 <span class="k">begin</span>
  <span class="n">SetRect</span><span class="p">(</span><span class="n">size</span><span class="o">,</span> <span class="mi">0</span><span class="o">,</span> <span class="mi">0</span><span class="o">,</span> <span class="n">viewWidth</span><span class="o">,</span> <span class="n">viewWidth</span><span class="p">)</span><span class="o">;</span>
  <span class="n">FillRect</span><span class="p">(</span><span class="n">size</span><span class="o">,</span> <span class="n">white</span><span class="p">)</span><span class="o">;</span>
 <span class="k">end</span><span class="o">;</span>

<span class="cm">{&gt;&gt;}</span>
 <span class="k">procedure</span> <span class="nf">Redraw</span><span class="o">;</span>
  <span class="k">var</span>
   <span class="n">i</span><span class="o">:</span> <span class="kt">Integer</span><span class="o">;</span>
 <span class="k">begin</span>
  <span class="n">ClearScreen</span><span class="o">;</span>
  <span class="n">LookAt</span><span class="p">(</span><span class="n">Long2Fix</span><span class="p">(</span><span class="o">-</span><span class="n">viewWidth</span><span class="p">)</span><span class="o">,</span> <span class="n">Long2Fix</span><span class="p">(</span><span class="n">viewheight</span><span class="p">)</span><span class="o">,</span> <span class="n">Long2Fix</span><span class="p">(</span><span class="n">viewWidth</span><span class="p">)</span><span class="o">,</span> <span class="n">Long2Fix</span><span class="p">(</span><span class="o">-</span><span class="n">viewHeight</span><span class="p">))</span><span class="o">;</span>
  <span class="n">ViewAngle</span><span class="p">(</span><span class="n">Long2Fix</span><span class="p">(</span><span class="mi">50</span><span class="p">))</span><span class="o">;</span>
  <span class="n">Identity</span><span class="o">;</span>
  <span class="n">Yaw</span><span class="p">(</span><span class="n">Long2Fix</span><span class="p">(</span><span class="n">hangle</span><span class="p">))</span><span class="o">;</span>
  <span class="n">Pitch</span><span class="p">(</span><span class="n">Long2Fix</span><span class="p">(</span><span class="n">vangle</span><span class="p">))</span><span class="o">;</span> <span class="cm">{ roll and pitch the plane }</span>
  <span class="n">DrawScene3D</span><span class="p">(</span><span class="n">scene</span><span class="p">)</span><span class="o">;</span>
 <span class="k">end</span><span class="o">;</span>

<span class="cm">{&gt;&gt;}</span>
 <span class="k">procedure</span> <span class="nf">WhenDownChanged</span><span class="o">;</span>
  <span class="k">var</span>
   <span class="n">hoff</span><span class="o">,</span> <span class="n">voff</span><span class="o">:</span> <span class="kt">Integer</span><span class="o">;</span>
 <span class="k">begin</span>
  <span class="n">hoff</span> <span class="o">:=</span> <span class="n">prev</span><span class="o">.</span><span class="n">h</span> <span class="o">-</span> <span class="n">cursor</span><span class="o">.</span><span class="n">h</span><span class="o">;</span>
  <span class="n">hangle</span> <span class="o">:=</span> <span class="n">hangle</span> <span class="o">+</span> <span class="n">hoff</span><span class="o">;</span>
  <span class="n">voff</span> <span class="o">:=</span> <span class="n">prev</span><span class="o">.</span><span class="n">v</span> <span class="o">-</span> <span class="n">cursor</span><span class="o">.</span><span class="n">v</span><span class="o">;</span>
  <span class="n">vangle</span> <span class="o">:=</span> <span class="n">vangle</span> <span class="o">+</span> <span class="n">voff</span><span class="o">;</span>
  <span class="n">Redraw</span><span class="o">;</span>
  <span class="n">GetMouse</span><span class="p">(</span><span class="n">prev</span><span class="p">)</span><span class="o">;</span>
 <span class="k">end</span><span class="o">;</span>

<span class="cm">{&gt;&gt;}</span>
 <span class="k">procedure</span> <span class="nf">WhenDown</span><span class="o">;</span>
 <span class="k">begin</span>
  <span class="n">GetMouse</span><span class="p">(</span><span class="n">cursor</span><span class="p">)</span><span class="o">;</span>
  <span class="k">if</span> <span class="n">cursor</span><span class="o">.</span><span class="n">h</span> <span class="o">&lt;&gt;</span> <span class="n">prev</span><span class="o">.</span><span class="n">h</span> <span class="k">then</span>
   <span class="k">if</span> <span class="n">cursor</span><span class="o">.</span><span class="n">v</span> <span class="o">&lt;&gt;</span> <span class="n">prev</span><span class="o">.</span><span class="n">v</span> <span class="k">then</span>
    <span class="n">WhenDownChanged</span><span class="o">;</span>
 <span class="k">end</span><span class="o">;</span>

<span class="cm">{&gt;&gt;}</span>
 <span class="k">procedure</span> <span class="nf">MainLoop</span><span class="o">;</span>
 <span class="k">begin</span>
  <span class="k">repeat</span> <span class="cm">{Until we click outside screen}</span>
   <span class="k">while</span> <span class="n">button</span> <span class="k">do</span>
    <span class="k">begin</span>
     <span class="n">GetMouse</span><span class="p">(</span><span class="n">cursor</span><span class="p">)</span><span class="o">;</span>
     <span class="n">GetMouse</span><span class="p">(</span><span class="n">prev</span><span class="p">)</span><span class="o">;</span>
     <span class="k">repeat</span> <span class="cm">{Tight loop until button up}</span>
      <span class="n">WhenDown</span><span class="o">;</span>
     <span class="k">until</span> <span class="k">not</span> <span class="n">Button</span><span class="o">;</span>
    <span class="k">end</span><span class="o">;</span>
  <span class="k">until</span> <span class="n">cursor</span><span class="o">.</span><span class="n">h</span> <span class="o">&lt;</span> <span class="mi">0</span><span class="o">;</span>
 <span class="k">end</span><span class="o">;</span>

 <span class="k">procedure</span> <span class="nf">InitWindow</span><span class="o">;</span>
 <span class="k">begin</span>
  <span class="n">viewWidth</span> <span class="o">:=</span> <span class="mi">500</span><span class="o">;</span>
  <span class="n">viewHeight</span> <span class="o">:=</span> <span class="mi">342</span><span class="o">;</span>
  <span class="n">padLeft</span> <span class="o">:=</span> <span class="mi">60</span><span class="o">;</span>
  <span class="n">padTop</span> <span class="o">:=</span> <span class="mi">60</span><span class="o">;</span>

  <span class="n">SetRect</span><span class="p">(</span><span class="n">drawingRect</span><span class="o">,</span> <span class="n">padLeft</span><span class="o">,</span> <span class="n">padTop</span><span class="o">,</span> <span class="n">padLeft</span> <span class="o">+</span> <span class="n">viewWidth</span><span class="o">,</span> <span class="n">padTop</span> <span class="o">+</span> <span class="n">viewHeight</span><span class="p">)</span><span class="o">;</span>
  <span class="n">SetDrawingRect</span><span class="p">(</span><span class="n">drawingRect</span><span class="p">)</span><span class="o">;</span>
  <span class="n">ShowDrawing</span><span class="o">;</span>
 <span class="k">end</span><span class="o">;</span>

<span class="k">begin</span>

 <span class="n">InitWindow</span><span class="o">;</span>
 <span class="n">InitGrf3D</span><span class="p">(</span><span class="k">nil</span><span class="p">)</span><span class="o">;</span>
 <span class="n">Open3DPort</span><span class="p">(</span><span class="o">@</span><span class="n">myPort3D</span><span class="p">)</span><span class="o">;</span>
 <span class="n">ViewPort</span><span class="p">(</span><span class="n">thePort</span><span class="o">^.</span><span class="n">portRect</span><span class="p">)</span><span class="o">;</span>

<span class="cm">{scene}</span>

 <span class="n">SetScene3D</span><span class="p">(</span><span class="n">scene</span><span class="p">)</span><span class="o">;</span>
 <span class="n">SetBox3D</span><span class="p">(</span><span class="n">box1</span><span class="o">,</span> <span class="o">-</span><span class="mi">100</span><span class="o">,</span> <span class="mi">0</span><span class="o">,</span> <span class="mi">0</span><span class="o">,</span> <span class="mi">100</span><span class="o">,</span> <span class="mi">100</span><span class="o">,</span> <span class="mi">100</span><span class="p">)</span><span class="o">;</span>
 <span class="n">SetWedge3D</span><span class="p">(</span><span class="n">wed1</span><span class="o">,</span> <span class="mi">0</span><span class="o">,</span> <span class="mi">0</span><span class="o">,</span> <span class="mi">0</span><span class="o">,</span> <span class="mi">100</span><span class="o">,</span> <span class="mi">100</span><span class="o">,</span> <span class="mi">100</span><span class="o">,</span> <span class="mi">50</span><span class="p">)</span><span class="o">;</span>
 <span class="n">SetPyramid3D</span><span class="p">(</span><span class="n">pyr1</span><span class="o">,</span> <span class="mi">100</span><span class="o">,</span> <span class="mi">0</span><span class="o">,</span> <span class="mi">0</span><span class="o">,</span> <span class="mi">100</span><span class="o">,</span> <span class="mi">100</span><span class="o">,</span> <span class="mi">100</span><span class="o">,</span> <span class="mi">50</span><span class="o">,</span> <span class="mi">50</span><span class="p">)</span><span class="o">;</span>

 <span class="n">AddShape3D</span><span class="p">(</span><span class="n">scene</span><span class="o">,</span> <span class="o">@</span><span class="n">box1</span><span class="p">)</span><span class="o">;</span>
 <span class="n">AddShape3D</span><span class="p">(</span><span class="n">scene</span><span class="o">,</span> <span class="o">@</span><span class="n">wed1</span><span class="p">)</span><span class="o">;</span>
 <span class="n">AddShape3D</span><span class="p">(</span><span class="n">scene</span><span class="o">,</span> <span class="o">@</span><span class="n">pyr1</span><span class="p">)</span><span class="o">;</span>

 <span class="n">TurnYShape3D</span><span class="p">(</span><span class="o">@</span><span class="n">pyr1</span><span class="p">)</span><span class="o">;</span>
 <span class="n">MoveShape3D</span><span class="p">(</span><span class="o">@</span><span class="n">pyr1</span><span class="o">,</span> <span class="mi">100</span><span class="o">,</span> <span class="mi">0</span><span class="o">,</span> <span class="mi">0</span><span class="p">)</span><span class="o">;</span>
 <span class="n">TurnYShape3D</span><span class="p">(</span><span class="o">@</span><span class="n">pyr1</span><span class="p">)</span><span class="o">;</span>

 <span class="n">Redraw</span><span class="o">;</span>
 <span class="n">MainLoop</span><span class="o">;</span>

<span class="k">end</span><span class="o">.</span>
</pre></div>
</div>
</div>
<script src="/static/linelight.js"></script>
</div></body>
</html>