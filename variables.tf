variable "main_site" {
  description = "Required: The site to host in AWS for example www.geek37.com or geek37.com. Must be lowercase and less than or equal to 37 characters in length."
  type    = string
}

variable "file_path" {
  description = "Required: The path to the files and folders to upload to S3. These should be in a folder by themselves as everything in the folder will be uploaded to S3 and publicly accessible."
  type    = string
}

variable "pattern" {
  description = "Optional: The path to the files and folders to upload to S3. These should be in a folder by themselves as everything in the folder will be uploaded to S3 and publicly accessible. Defaults to **"
  type    = string
  default = "**"
}

variable "redirects" {
  description = "Optional : The sites that will redirect to the main site. For example www.geek37.com redirects to main site geek37.com."
  type    = list(string)
  default = []
}

variable "index_document" {
  description = "Optional : the default file to load defaults to index.html"
  type    = string
  default = "index.html"
}

variable "error_document" {
  description = "Optional : the default error file to load when a file is not found. Defaults to error.html"
  type    = string
  default = "error.html"
}

variable "route53_zone" {
  description = "Optional : The Route53 Zone to used to create the DNS entry in."
  type    = string
  default = "none"
}

variable "tls_algorithm" {
  description = "Optional : (String) Name of the algorithm to use when generating the private key. Currently-supported values are: RSA, ECDSA, ED25519. Defaults to RSA"
  type    = string
  default = "RSA"
}

variable "tls_ecdsa_curve" {
  description = "Optional : (String) When algorithm is ECDSA, the name of the elliptic curve to use. Currently-supported values are: P224, P256, P384, P521. (default: P224)."
  type    = string
  default = "P224"
}

variable "tls_rsa_bits" {
  description = "Optional : (Number) When algorithm is RSA, the size of the generated RSA key, in bits (default: 2048)."
  type    = number
  default = 2048
}

variable "acme_registration_email_address" {
  description = "Optional : (string) - The contact email address for the account. Required if TLS is utilized."
  type    = string
  default = "none"
}

variable "aws_cloudfront_price_class" {
  description = "Optional : (string) - The price class for this distribution. One of PriceClass_All, PriceClass_200, PriceClass_100. Defaults to PriceClass_100."
  type    = string
  default = "PriceClass_100"
}

variable "context_types" {
  description = "Optional : list of file extensions and their respective context types."
  type = map(string)
  default = {
    t = "text/troff"
    s = "text/x-asm"
    c = "text/x-c"
    f = "text/x-fortran"
    p = "text/x-pascal"
    aw = "application/applixware"
    cu = "application/cu-seeme"
    es = "application/ecmascript"
    js = "application/javascript"
    ma = "application/mathematica"
    p8 = "application/pkcs8"
    ac = "application/pkix-attr-cert"
    ai = "application/postscript"
    rl = "application/resource-lists+xml"
    rs = "application/rls-services+xml"
    rq = "application/sparql-query"
    fm = "application/vnd.framemaker"
    sc = "application/vnd.ibm.secure-container"
    xo = "application/vnd.olpc-sugar"
    dp = "application/vnd.osgi.dp"
    wg = "application/vnd.pmi.widget"
    rm = "application/vnd.rn-realmedia"
    st = "application/vnd.sailingtracker.track"
    sm = "application/vnd.stepmania.stepchart"
/*    7z = "application/x-7z-compressed" */
    bz = "application/x-bzip"
    nc = "application/x-netcdf"
    sh = "application/x-sh"
    au = "audio/basic"
    g3 = "image/g3fax"
    fh = "image/x-freehand"
    n3 = "text/n3"
    gv = "text/vnd.graphviz"
    uu = "text/x-uuencode"
    qt = "video/quicktime"
    wm = "video/x-ms-wm"
    exi = "application/exi"
    pfr = "application/font-tdpfr"
    gpx = "application/gpx+xml"
    stk = "application/hyperstudio"
    jar = "application/java-archive"
    ser = "application/java-serialized-object"
    hqx = "application/mac-binhex40"
    cpt = "application/mac-compactpro"
    mrc = "application/marc"
    m21 = "application/mp21"
    doc = "application/msword"
    mxf = "application/mxf"
    bin = "application/octet-stream"
    oda = "application/oda"
    opf = "application/oebps-package+xml"
    ogx = "application/ogg"
    xer = "application/patch-ops-error+xml"
    pdf = "application/pdf"
    pgp = "application/pgp-encrypted"
    prf = "application/pics-rules"
    p10 = "application/pkcs10"
    p7m = "application/pkcs7-mime"
    p7s = "application/pkcs7-signature"
    cer = "application/pkix-cert"
    pki = "application/pkixcmp"
    crl = "application/pkix-crl"
    pls = "application/pls+xml"
    cww = "application/prs.cww"
    rdf = "application/rdf+xml"
    rif = "application/reginfo+xml"
    rnc = "application/relax-ng-compact-syntax"
    rld = "application/resource-lists-diff+xml"
    rsd = "application/rsd+xml"
    rss = "application/rss+xml"
    rtf = "application/rtf"
    scq = "application/scvp-cv-request"
    scs = "application/scvp-cv-response"
    spq = "application/scvp-vp-request"
    spp = "application/scvp-vp-response"
    sdp = "application/sdp"
    shf = "application/shf+xml"
    smi = "application/smil+xml"
    srx = "application/sparql-results+xml"
    sru = "application/sru+xml"
    tei = "application/tei+xml"
    tfi = "application/thraud+xml"
    tsd = "application/timestamped-data"
    plb = "application/vnd.3gpp.pic-bw-large"
    psb = "application/vnd.3gpp.pic-bw-small"
    pvb = "application/vnd.3gpp.pic-bw-var"
    pwn = "application/vnd.3m.post-it-notes"
    aso = "application/vnd.accpac.simply.aso"
    imp = "application/vnd.accpac.simply.imp"
    acu = "application/vnd.acucobol"
    atc = "application/vnd.acucorp"
    air = "application/vnd.adobe.air-application-installer-package+zip"
    fxp = "application/vnd.adobe.fxp"
    xdp = "application/vnd.adobe.xdp+xml"
    azf = "application/vnd.airzip.filesecure.azf"
    azs = "application/vnd.airzip.filesecure.azs"
    azw = "application/vnd.amazon.ebook"
    acc = "application/vnd.americandynamics.acc"
    ami = "application/vnd.amiga.ami"
    apk = "application/vnd.android.package-archive"
    cii = "application/vnd.anser-web-certificate-issue-initiation"
    fti = "application/vnd.anser-web-funds-transfer-initiation"
    atx = "application/vnd.antix.game-component"
    swi = "application/vnd.aristanetworks.swi"
    aep = "application/vnd.audiograph"
    mpm = "application/vnd.blueice.multipass"
    bmi = "application/vnd.bmi"
    rep = "application/vnd.businessobjects"
    mmd = "application/vnd.chipnuts.karaoke-mmd"
    cdy = "application/vnd.cinderella"
    cla = "application/vnd.claymore"
    rp9 = "application/vnd.cloanto.rp9"
    c4g = "application/vnd.clonk.c4group"
    csp = "application/vnd.commonspace"
    cmc = "application/vnd.cosmocaller"
    wbs = "application/vnd.criticaltools.wbs+xml"
    pml = "application/vnd.ctc-posml"
    ppd = "application/vnd.cups-ppd"
    car = "application/vnd.curl.car"
    rdz = "application/vnd.data-vision.rdz"
    dna = "application/vnd.dna"
    mlp = "application/vnd.dolby.mlp"
    dpg = "application/vnd.dpgraph"
    ait = "application/vnd.dvb.ait"
    svc = "application/vnd.dvb.service"
    geo = "application/vnd.dynageo"
    mag = "application/vnd.ecowin.chart"
    nml = "application/vnd.enliven"
    esf = "application/vnd.epson.esf"
    msf = "application/vnd.epson.msf"
    qam = "application/vnd.epson.quickanime"
    slt = "application/vnd.epson.salt"
    ssf = "application/vnd.epson.ssf"
    es3 = "application/vnd.eszigno3+xml"
    ez2 = "application/vnd.ezpix-album"
    ez3 = "application/vnd.ezpix-package"
    fdf = "application/vnd.fdf"
    gph = "application/vnd.flographit"
    ftc = "application/vnd.fluxtime.clip"
    fnc = "application/vnd.frogans.fnc"
    ltf = "application/vnd.frogans.ltf"
    fsc = "application/vnd.fsc.weblaunch"
    oas = "application/vnd.fujitsu.oasys"
    oa2 = "application/vnd.fujitsu.oasys2"
    oa3 = "application/vnd.fujitsu.oasys3"
    fg5 = "application/vnd.fujitsu.oasysgp"
    bh2 = "application/vnd.fujitsu.oasysprs"
    ddd = "application/vnd.fujixerox.ddd"
    xdw = "application/vnd.fujixerox.docuworks"
    xbd = "application/vnd.fujixerox.docuworks.binder"
    fzs = "application/vnd.fuzzysheet"
    txd = "application/vnd.genomatix.tuxedo"
    ggb = "application/vnd.geogebra.file"
    ggt = "application/vnd.geogebra.tool"
    gex = "application/vnd.geometry-explorer"
    gxt = "application/vnd.geonext"
    g2w = "application/vnd.geoplan"
    g3w = "application/vnd.geospace"
    gmx = "application/vnd.gmx"
    kml = "application/vnd.google-earth.kml+xml"
    kmz = "application/vnd.google-earth.kmz"
    gqf = "application/vnd.grafeq"
    gac = "application/vnd.groove-account"
    ghf = "application/vnd.groove-help"
    gim = "application/vnd.groove-identity-message"
    grv = "application/vnd.groove-injector"
    gtm = "application/vnd.groove-tool-message"
    tpl = "application/vnd.groove-tool-template"
    vcg = "application/vnd.groove-vcard"
    hal = "application/vnd.hal+xml"
    zmm = "application/vnd.handheld-entertainment+xml"
    les = "application/vnd.hhe.lesson-player"
    hps = "application/vnd.hp-hps"
    jlt = "application/vnd.hp-jlyt"
    pcl = "application/vnd.hp-pcl"
    x3d = "application/vnd.hzn-3d-crossword"
    mpy = "application/vnd.ibm.minipay"
    afp = "application/vnd.ibm.modcap"
    irm = "application/vnd.ibm.rights-management"
    icc = "application/vnd.iccprofile"
    igl = "application/vnd.igloader"
    ivp = "application/vnd.immervision-ivp"
    ivu = "application/vnd.immervision-ivu"
    igm = "application/vnd.insors.igm"
    xpw = "application/vnd.intercon.formnet"
    i2g = "application/vnd.intergeo"
    qbo = "application/vnd.intu.qbo"
    qfx = "application/vnd.intu.qfx"
    irp = "application/vnd.irepository.package+xml"
    fcs = "application/vnd.isac.fcs"
    xpr = "application/vnd.is-xpr"
    jam = "application/vnd.jam"
    rms = "application/vnd.jcp.javame.midlet-rms"
    ktz = "application/vnd.kahootz"
    kfo = "application/vnd.kde.kformula"
    flw = "application/vnd.kde.kivio"
    kon = "application/vnd.kde.kontour"
    kpr = "application/vnd.kde.kpresenter"
    ksp = "application/vnd.kde.kspread"
    kwd = "application/vnd.kde.kword"
    kia = "application/vnd.kidspiration"
    kne = "application/vnd.kinar"
    skp = "application/vnd.koan"
    sse = "application/vnd.kodak-descriptor"
    lbd = "application/vnd.llamagraphics.life-balance.desktop"
    lbe = "application/vnd.llamagraphics.life-balance.exchange+xml"
    apr = "application/vnd.lotus-approach"
    pre = "application/vnd.lotus-freelance"
    nsf = "application/vnd.lotus-notes"
    org = "application/vnd.lotus-organizer"
    scm = "application/vnd.lotus-screencam"
    lwp = "application/vnd.lotus-wordpro"
    mcd = "application/vnd.mcd"
    mc1 = "application/vnd.medcalcdata"
    mwf = "application/vnd.mfer"
    mfm = "application/vnd.mfmp"
    flo = "application/vnd.micrografx.flo"
    igx = "application/vnd.micrografx.igx"
    mif = "application/vnd.mif"
    daf = "application/vnd.mobius.daf"
    dis = "application/vnd.mobius.dis"
    mbk = "application/vnd.mobius.mbk"
    mqy = "application/vnd.mobius.mqy"
    msl = "application/vnd.mobius.msl"
    plc = "application/vnd.mobius.plc"
    txf = "application/vnd.mobius.txf"
    mpn = "application/vnd.mophun.application"
    mpc = "application/vnd.mophun.certificate"
    xul = "application/vnd.mozilla.xul+xml"
    cil = "application/vnd.ms-artgalry"
    cab = "application/vnd.ms-cab-compressed"
    xls = "application/vnd.ms-excel"
    eot = "application/vnd.ms-fontobject"
    chm = "application/vnd.ms-htmlhelp"
    ims = "application/vnd.ms-ims"
    lrm = "application/vnd.ms-lrm"
    cat = "application/vnd.ms-pki.seccat"
    stl = "application/vnd.ms-pki.stl"
    ppt = "application/vnd.ms-powerpoint"
    mpp = "application/vnd.ms-project"
    wps = "application/vnd.ms-works"
    wpl = "application/vnd.ms-wpl"
    xps = "application/vnd.ms-xpsdocument"
    mus = "application/vnd.musician"
    nlu = "application/vnd.neurolanguage.nlu"
    nnd = "application/vnd.noblenet-directory"
    nns = "application/vnd.noblenet-sealer"
    nnw = "application/vnd.noblenet-web"
    edm = "application/vnd.novadigm.edm"
    edx = "application/vnd.novadigm.edx"
    ext = "application/vnd.novadigm.ext"
    odc = "application/vnd.oasis.opendocument.chart"
    otc = "application/vnd.oasis.opendocument.chart-template"
    odb = "application/vnd.oasis.opendocument.database"
    odf = "application/vnd.oasis.opendocument.formula"
    odg = "application/vnd.oasis.opendocument.graphics"
    otg = "application/vnd.oasis.opendocument.graphics-template"
    odi = "application/vnd.oasis.opendocument.image"
    oti = "application/vnd.oasis.opendocument.image-template"
    odp = "application/vnd.oasis.opendocument.presentation"
    otp = "application/vnd.oasis.opendocument.presentation-template"
    ods = "application/vnd.oasis.opendocument.spreadsheet"
    ots = "application/vnd.oasis.opendocument.spreadsheet-template"
    odt = "application/vnd.oasis.opendocument.text"
    odm = "application/vnd.oasis.opendocument.text-master"
    ott = "application/vnd.oasis.opendocument.text-template"
    oth = "application/vnd.oasis.opendocument.text-web"
    dd2 = "application/vnd.oma.dd2+xml"
    oxt = "application/vnd.openofficeorg.extension"
    mgp = "application/vnd.osgeo.mapguide.package"
    pdb = "application/vnd.palm"
    paw = "application/vnd.pawaafile"
    str = "application/vnd.pg.format"
    ei6 = "application/vnd.pg.osasli"
    plf = "application/vnd.pocketlearn"
    pbd = "application/vnd.powerbuilder6"
    box = "application/vnd.previewsystems.box"
    mgz = "application/vnd.proteus.magazine"
    qps = "application/vnd.publishare-delta-tree"
    qxd = "application/vnd.quark.quarkxpress"
    bed = "application/vnd.realvnc.bed"
    mxl = "application/vnd.recordare.musicxml"
    cod = "application/vnd.rim.cod"
    see = "application/vnd.seemail"
    ifm = "application/vnd.shana.informed.formdata"
    itp = "application/vnd.shana.informed.formtemplate"
    iif = "application/vnd.shana.informed.interchange"
    ipk = "application/vnd.shana.informed.package"
    twd = "application/vnd.simtech-mindmapper"
    mmf = "application/vnd.smaf"
    dxp = "application/vnd.spotfire.dxp"
    sfs = "application/vnd.spotfire.sfs"
    sdc = "application/vnd.stardivision.calc"
    sda = "application/vnd.stardivision.draw"
    sdd = "application/vnd.stardivision.impress"
    smf = "application/vnd.stardivision.math"
    sdw = "application/vnd.stardivision.writer"
    sgl = "application/vnd.stardivision.writer-global"
    sxc = "application/vnd.sun.xml.calc"
    stc = "application/vnd.sun.xml.calc.template"
    sxd = "application/vnd.sun.xml.draw"
    std = "application/vnd.sun.xml.draw.template"
    sxi = "application/vnd.sun.xml.impress"
    sti = "application/vnd.sun.xml.impress.template"
    sxm = "application/vnd.sun.xml.math"
    sxw = "application/vnd.sun.xml.writer"
    sxg = "application/vnd.sun.xml.writer.global"
    stw = "application/vnd.sun.xml.writer.template"
    sus = "application/vnd.sus-calendar"
    svd = "application/vnd.svd"
    sis = "application/vnd.symbian.install"
    bdm = "application/vnd.syncml.dm+wbxml"
    xdm = "application/vnd.syncml.dm+xml"
    xsm = "application/vnd.syncml+xml"
    tao = "application/vnd.tao.intent-module-archive"
    tmo = "application/vnd.tmobile-livetv"
    tpt = "application/vnd.trid.tpt"
    mxs = "application/vnd.triscape.mxs"
    tra = "application/vnd.trueapp"
    ufd = "application/vnd.ufdl"
    utz = "application/vnd.uiq.theme"
    umj = "application/vnd.umajin"
    vcx = "application/vnd.vcx"
    vsd = "application/vnd.visio"
    vis = "application/vnd.visionary"
    vsf = "application/vnd.vsf"
    wtb = "application/vnd.webturbo"
    nbp = "application/vnd.wolfram.player"
    wpd = "application/vnd.wordperfect"
    wqd = "application/vnd.wqd"
    stf = "application/vnd.wt.stf"
    xar = "application/vnd.xara"
    hvd = "application/vnd.yamaha.hv-dic"
    hvs = "application/vnd.yamaha.hv-script"
    hvp = "application/vnd.yamaha.hv-voice"
    osf = "application/vnd.yamaha.openscoreformat"
    saf = "application/vnd.yamaha.smaf-audio"
    spf = "application/vnd.yamaha.smaf-phrase"
    cmp = "application/vnd.yellowriver-custom-menu"
    zir = "application/vnd.zul"
    zaz = "application/vnd.zzazz.deck+xml"
    wgt = "application/widget"
    hlp = "application/winhlp"
    abw = "application/x-abiword"
    ace = "application/x-ace-compressed"
    dmg = "application/x-apple-diskimage"
    aab = "application/x-authorware-bin"
    aam = "application/x-authorware-map"
    aas = "application/x-authorware-seg"
    bz2 = "application/x-bzip2"
    xdf = "application/xcap-diff+xml"
    vcd = "application/x-cdlink"
    pgn = "application/x-chess-pgn"
    csh = "application/x-csh"
    deb = "application/x-debian-package"
    dir = "application/x-director"
    wad = "application/x-doom"
    ncx = "application/x-dtbncx+xml"
    dtb = "application/x-dtbook+xml"
    res = "application/x-dtbresource+xml"
    dvi = "application/x-dvi"
    bdf = "application/x-font-bdf"
    gsf = "application/x-font-ghostscript"
    psf = "application/x-font-linux-psf"
    otf = "application/x-font-otf"
    pcf = "application/x-font-pcf"
    snf = "application/x-font-snf"
    ttf = "application/x-font-ttf"
    pfa = "application/x-font-type1"
    spl = "application/x-futuresplash"
    hdf = "application/x-hdf"
    xml = "application/xml"
    dtd = "application/xml-dtd"
    prc = "application/x-mobipocket-ebook"
    mdb = "application/x-msaccess"
    obd = "application/x-msbinder"
    crd = "application/x-mscardfile"
    clp = "application/x-msclip"
    exe = "application/x-msdownload"
    mvb = "application/x-msmediaview"
    wmf = "application/x-msmetafile"
    mny = "application/x-msmoney"
    pub = "application/x-mspublisher"
    scd = "application/x-msschedule"
    trm = "application/x-msterminal"
    wmd = "application/x-ms-wmd"
    wmz = "application/x-ms-wmz"
    wri = "application/x-mswrite"
    xop = "application/xop+xml"
    p12 = "application/x-pkcs12"
    p7b = "application/x-pkcs7-certificates"
    p7r = "application/x-pkcs7-certreqresp"
    rar = "application/x-rar-compressed"
    swf = "application/x-shockwave-flash"
    xap = "application/x-silverlight-app"
    sit = "application/x-stuffit"
    tar = "application/x-tar"
    tcl = "application/x-tcl"
    tex = "application/x-tex"
    tfm = "application/x-tex-tfm"
    src = "application/x-wais-source"
    der = "application/x-x509-ca-cert"
    fig = "application/x-xfig"
    xpi = "application/x-xpinstall"
    yin = "application/yin+xml"
    zip = "application/zip"
    adp = "audio/adpcm"
    mid = "audio/midi"
    oga = "audio/ogg"
    uva = "audio/vnd.dece.audio"
    eol = "audio/vnd.digital-winds"
    dra = "audio/vnd.dra"
    dts = "audio/vnd.dts"
    lvp = "audio/vnd.lucent.voice"
    pya = "audio/vnd.ms-playready.media.pya"
    rip = "audio/vnd.rip"
    aac = "audio/x-aac"
    aif = "audio/x-aiff"
    m3u = "audio/x-mpegurl"
    wax = "audio/x-ms-wax"
    wma = "audio/x-ms-wma"
    ram = "audio/x-pn-realaudio"
    rmp = "audio/x-pn-realaudio-plugin"
    wav = "audio/x-wav"
    cdx = "chemical/x-cdx"
    cif = "chemical/x-cif"
    cml = "chemical/x-cml"
    xyz = "chemical/x-xyz"
    bmp = "image/bmp"
    cgm = "image/cgm"
    gif = "image/gif"
    ief = "image/ief"
    jpg = "image/jpeg"
    ktx = "image/ktx"
    png = "image/png"
    svg = "image/svg+xml"
    psd = "image/vnd.adobe.photoshop"
    uvi = "image/vnd.dece.graphic"
    sub = "image/vnd.dvb.subtitle"
    dwg = "image/vnd.dwg"
    dxf = "image/vnd.dxf"
    fbs = "image/vnd.fastbidsheet"
    fpx = "image/vnd.fpx"
    fst = "image/vnd.fst"
    mmr = "image/vnd.fujixerox.edmics-mmr"
    rlc = "image/vnd.fujixerox.edmics-rlc"
    mdi = "image/vnd.ms-modi"
    npx = "image/vnd.net-fpx"
    xif = "image/vnd.xiff"
    ras = "image/x-cmu-raster"
    cmx = "image/x-cmx"
    ico = "image/x-icon"
    pcx = "image/x-pcx"
    pic = "image/x-pict"
    pnm = "image/x-portable-anymap"
    pbm = "image/x-portable-bitmap"
    pgm = "image/x-portable-graymap"
    ppm = "image/x-portable-pixmap"
    rgb = "image/x-rgb"
    xbm = "image/x-xbitmap"
    xpm = "image/x-xpixmap"
    xwd = "image/x-xwindowdump"
    eml = "message/rfc822"
    igs = "model/iges"
    msh = "model/mesh"
    dae = "model/vnd.collada+xml"
    dwf = "model/vnd.dwf"
    gdl = "model/vnd.gdl"
    gtw = "model/vnd.gtw"
    mts = "model/vnd.mts"
    vtu = "model/vnd.vtu"
    wrl = "model/vrml"
    ics = "text/calendar"
    css = "text/css"
    csv = "text/csv"
    txt = "text/plain"
    par = "text/plain-bas"
    dsc = "text/prs.lines.tag"
    rtx = "text/richtext"
    tsv = "text/tab-separated-values"
    ttl = "text/turtle"
    uri = "text/uri-list"
    fly = "text/vnd.fly"
    flx = "text/vnd.fmi.flexstor"
    jad = "text/vnd.sun.j2me.app-descriptor"
    wml = "text/vnd.wap.wml"
    etx = "text/x-setext"
    vcs = "text/x-vcalendar"
    vcf = "text/x-vcard"
/*    3gp = "video/3gpp" */
/*    3g2 = "video/3gpp2" */
    jpm = "video/jpm"
    mj2 = "video/mj2"
    mp4 = "video/mp4"
    ogv = "video/ogg"
    uvh = "video/vnd.dece.hd"
    uvm = "video/vnd.dece.mobile"
    uvp = "video/vnd.dece.pd"
    uvs = "video/vnd.dece.sd"
    uvv = "video/vnd.dece.video"
    fvt = "video/vnd.fvt"
    mxu = "video/vnd.mpegurl"
    pyv = "video/vnd.ms-playready.media.pyv"
    uvu = "video/vnd.uvvu.mp4"
    viv = "video/vnd.vivo"
    f4v = "video/x-f4v"
    fli = "video/x-fli"
    flv = "video/x-flv"
    m4v = "video/x-m4v"
    asf = "video/x-ms-asf"
    avi = "video/x-msvideo"
    wmv = "video/x-ms-wmv"
    wmx = "video/x-ms-wmx"
    wvx = "video/x-ms-wvx"
    ice = "x-conference/x-cooltalk"
    atom = "application/atom+xml"
    dssc = "application/dssc+der"
    emma = "application/emma+xml"
    epub = "application/epub+zip"
    json = "application/json"
    mads = "application/mads+xml"
    mrcx = "application/marcxml+xml"
    mbox = "application/mbox"
    mets = "application/mets+xml"
    mods = "application/mods+xml"
    sbml = "application/sbml+xml"
    gram = "application/srgs"
    ssml = "application/ssml+xml"
    tcap = "application/vnd.3gpp2.tcap"
    xfdf = "application/vnd.adobe.xfdf"
    mpkg = "application/vnd.apple.installer+xml"
    m3u8 = "application/vnd.apple.mpegurl"
    clkx = "application/vnd.crick.clicker"
    clkk = "application/vnd.crick.clicker.keyboard"
    clkp = "application/vnd.crick.clicker.palette"
    clkt = "application/vnd.crick.clicker.template"
    clkw = "application/vnd.crick.clicker.wordbank"
    dfac = "application/vnd.dreamfactory"
    seed = "application/vnd.fdsn.seed"
    hbci = "application/vnd.hbci"
    hpgl = "application/vnd.hp-hpgl"
    hpid = "application/vnd.hp-hpid"
    jisp = "application/vnd.jisp"
    joda = "application/vnd.joost.joda-archive"
    chrt = "application/vnd.kde.kchart"
    htke = "application/vnd.kenameaapp"
    mseq = "application/vnd.mseq"
    xlam = "application/vnd.ms-excel.addin.macroenabled.12"
    xlsb = "application/vnd.ms-excel.sheet.binary.macroenabled.12"
    xlsm = "application/vnd.ms-excel.sheet.macroenabled.12"
    xltm = "application/vnd.ms-excel.template.macroenabled.12"
    thmx = "application/vnd.ms-officetheme"
    ppam = "application/vnd.ms-powerpoint.addin.macroenabled.12"
    pptm = "application/vnd.ms-powerpoint.presentation.macroenabled.12"
    sldm = "application/vnd.ms-powerpoint.slide.macroenabled.12"
    ppsm = "application/vnd.ms-powerpoint.slideshow.macroenabled.12"
    potm = "application/vnd.ms-powerpoint.template.macroenabled.12"
    docm = "application/vnd.ms-word.document.macroenabled.12"
    dotm = "application/vnd.ms-word.template.macroenabled.12"
    msty = "application/vnd.muvee.style"
    rpst = "application/vnd.nokia.radio-preset"
    rpss = "application/vnd.nokia.radio-presets"
    odft = "application/vnd.oasis.opendocument.formula-template"
    pptx = "application/vnd.openxmlformats-officedocument.presentationml.presentation"
    sldx = "application/vnd.openxmlformats-officedocument.presentationml.slide"
    ppsx = "application/vnd.openxmlformats-officedocument.presentationml.slideshow"
    potx = "application/vnd.openxmlformats-officedocument.presentationml.template"
    xlsx = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
    xltx = "application/vnd.openxmlformats-officedocument.spreadsheetml.template"
    docx = "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
    dotx = "application/vnd.openxmlformats-officedocument.wordprocessingml.template"
    efif = "application/vnd.picsel"
    ptid = "application/vnd.pvi.ptid1"
    sema = "application/vnd.sema"
    semd = "application/vnd.semd"
    semf = "application/vnd.semf"
    sdkm = "application/vnd.solent.sdkm+xml"
    uoml = "application/vnd.uoml+xml"
    vsdx = "application/vnd.visio2013"
    wmlc = "application/vnd.wap.wmlc"
    xfdl = "application/vnd.xfdl"
    vxml = "application/voicexml+xml"
    wsdl = "application/wsdl+xml"
    chat = "application/x-chat"
    cpio = "application/x-cpio"
    xenc = "application/xenc+xml"
    woff = "application/x-font-woff"
    gtar = "application/x-gtar"
    jnlp = "application/x-java-jnlp-file"
    xbap = "application/x-ms-xbap"
    shar = "application/x-shar"
    xslt = "application/xslt+xml"
    xspf = "application/xspf+xml"
    sitx = "application/x-stuffitx"
    mxml = "application/xv+xml"
    yang = "application/yang"
    mp4a = "audio/mp4"
    mpga = "audio/mpeg"
    weba = "audio/webm"
    cmdf = "chemical/x-cmdf"
    csml = "chemical/x-csml"
    jpeg = "image/jpeg"
    btif = "image/prs.btif"
    tiff = "image/tiff"
    djvu = "image/vnd.djvu"
    wbmp = "image/vnd.wap.wbmp"
    webp = "image/webp"
    html = "text/html"
    sgml = "text/sgml"
    curl = "text/vnd.curl"
/*    3dml = "text/vnd.in3d.3dml" */
    spot = "text/vnd.in3d.spot"
    wmls = "text/vnd.wap.wmlscript"
    java = "text/x-java-source,java"
    yaml = "text/yaml"
    h261 = "video/h261"
    h263 = "video/h263"
    h264 = "video/h264"
    jpgv = "video/jpeg"
    mpeg = "video/mpeg"
    webm = "video/webm"
    ccxml = "application/ccxml+xml,"
    cdmia = "application/cdmi-capability"
    cdmic = "application/cdmi-container"
    cdmid = "application/cdmi-domain"
    cdmio = "application/cdmi-object"
    cdmiq = "application/cdmi-queue"
    xdssc = "application/dssc+xml"
    ipfix = "application/ipfix"
    class = "application/java-vm"
    mscml = "application/mediaservercontrol+xml"
    meta4 = "application/metalink4+xml"
    grxml = "application/srgs+xml"
    ahead = "application/vnd.ahead.space"
    cdxml = "application/vnd.chemdraw+xml"
    pcurl = "application/vnd.curl.pcurl"
    pclxl = "application/vnd.hp-pclxl"
    cdkey = "application/vnd.mediastation.cdkey"
    ngdat = "application/vnd.nokia.n-gage.data"
    wbxml = "application/vnd.wap.wbxml"
    wmlsc = "application/vnd.wap.wmlscriptc"
    bcpio = "application/x-bcpio"
    xhtml = "application/xhtml+xml"
    latex = "application/x-latex"
    ustar = "application/x-ustar"
    dtshd = "audio/vnd.dts.hd"
    pjpeg = "image/pjpeg"
    dcurl = "text/vnd.curl.dcurl"
    mcurl = "text/vnd.curl.mcurl"
    scurl = "text/vnd.curl.scurl"
    movie = "video/x-sgi-movie"
    mathml = "application/mathml+xml"
    onetoc = "application/onenote"
    setpay = "application/set-payment-initiation"
    setreg = "application/set-registration-initiation"
    c11amc = "application/vnd.cluetrust.cartomobile-config"
    c11amz = "application/vnd.cluetrust.cartomobile-config-pkg"
    karbon = "application/vnd.kde.karbon"
    lasxml = "application/vnd.las.las+xml"
    n-gage = "application/vnd.nokia.n-gage.symbian.install"
    link66 = "application/vnd.route66.link66+xml"
    osfpvg = "application/vnd.yamaha.openscoreformat.osfpvg+xml"
    sv4crc = "application/x-sv4crc"
    atomcat = "application/atomcat+xml"
    atomsvc = "application/atomsvc+xml"
    pkipath = "application/pkix-pkipath"
    pskcxml = "application/pskc+xml"
    cdbcmsg = "application/vnd.contact.cmsg"
    portpkg = "application/vnd.macports.portpkg"
    teacher = "application/vnd.smart.teacher"
    torrent = "application/x-bittorrent"
    sv4cpio = "application/x-sv4cpio"
    texinfo = "application/x-texinfo"
    davmount = "application/davmount+xml"
    musicxml = "application/vnd.recordare.musicxml+xml"
    unityweb = "application/vnd.unity"
    wspolicy = "application/wspolicy+xml"
    gnumeric = "application/x-gnumeric"
    fe_launch = "application/vnd.denovo.fcselayout-link"
    sfd-hdstx = "application/vnd.hydrostatix.sof-data"
    rcprofile = "application/vnd.ipunplugged.rcprofile"
    ecelp4800 = "audio/vnd.nuera.ecelp4800"
    ecelp7470 = "audio/vnd.nuera.ecelp7470"
    ecelp9600 = "audio/vnd.nuera.ecelp9600"
    cryptonote = "application/vnd.rig.cryptonote"
    application = "application/x-ms-application"
  }
}