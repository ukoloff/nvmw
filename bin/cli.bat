0</*! ::
@echo off
cscript //nologo //e:javascript "%~f0" %*
goto :EOF */0;
!function(n){function t(r){if(e[r])return e[r].exports;var i=e[r]={exports:{},id:r,loaded:!1};return n[r].call(i.exports,i,i.exports,t),
i.loaded=!0,i.exports}var e={};return t.m=n,t.c=e,t.p="",t(0)}([function(n,t,e){(function(n){n(function(){return e(39)})}).call(t,e(15));
},function(n,t){n.exports=new ActiveXObject("Scripting.FileSystemObject")},function(n,t,e){(function(t){var e=[].slice;n.exports=function(){
var n;return n=1<=arguments.length?e.call(arguments,0):[],t.Echo(n.join(" "))}}).call(t,e(6))},function(n,t,e){(function(t,e){var r;
n.exports=r=t.BuildPath(e.SpecialFolders("AppData"),"nvm$")}).call(t,e(1),e(4))},function(n,t){n.exports=new ActiveXObject("WScript.Shell");
},function(n,t,e){(function(n,e,r,i,o){var s,a,l,u,c;t.name=l="junction.exe",t.dst=s=function(){return n.BuildPath(e,l)},t.link=a=n.BuildPath(e,"this"),
c=function(n){var t;for(t=[];!n.Status;)t.push(r.Sleep(100));return t},t.remove=u=function(){return c(i.exec('"'+s()+'" -d "'+a+'"'));
},t.exec=function(t,r){return o(t),r&&n.FolderExists(a)?void 0:(u(),i.exec('"'+s()+'" "'+a+'" "'+n.BuildPath(e,t)+'"'))},t.eula=function(){
return i.RegWrite("HKCU\\Software\\Sysinternals\\Junction\\EulaAccepted",1,"REG_DWORD")}}).call(t,e(1),e(3),e(6),e(4),e(11))},function(n,t){
n.exports=WScript},function(n,t){var e,r,i,o;t.cmpv=i=function(n,t){return n===t?0:t>n?-1:1},t.cmpa=r=function(n,t,e){var r,i,o,s;
for(r=0,i=n.length,o=t.length;;){switch(Number(i>r)+2*Number(o>r)){case 0:return 0;case 1:return 1;case 2:return-1;default:if(s=e(n[r],t[r]))return s;
}r++}},t.cmp=e=function(n,t){return r(n,t,function(n,t){return r(n,t,i)})},t.cmpi=function(n,t){return e(n.id,t.id)},o=function(n,t,e){
var r,i,o,s;for(r=i=0,o=t.length;o>i;r=++i)if(s=t[r],null!=s&&!e(n[r],s))return!1;return!0},t.match=function(n,t){return o(n,t,function(n,t){
return o(n,t,function(n,t){return n===t})})}},function(n,t,e){(function(n,e,r,i){var o,s,a,l,u;t.title="Install some version of Node.js",
a=function(){var t;t=[];for(s in n)t.push(s);return t}(),t.args64=o="[x86|x64]",t.args="["+a.join("|")+"] [n[.n[.n]]] "+o,t.help="Install specified Node.js version (latest matching filter).\n\nUse `nvm$ ls remote` to see available Node.js versions.",
t.cmd=function(n){var t,i,o,s,a,u;for(t=l(n),a=e().reverse(),i=0,o=a.length;o>i;i++)if(s=a[i],r.match(s.id,t.z)){u=s;break}if(!u)throw Error("Specified Node.js version not found!");
return u.install(t.x64)},t.x64=u=function(n){return/^x(\d)/.test(n)?"6"===RegExp.$1:void 0},t.parse=l=function(n){var t,e,r,o,s,l,c;
for(null==n&&(n=[]),r=new i,r.add({words:a}),s={},t=0,o=n.length;o>t;t++)c=n[t],(l=r.is(c))?s.dist=l:null!=(e=u(c))?s.x64=e:/^\d/.test(c)&&(s.ver=function(){
var n,t,e,r;for(e=c.split(/\D+/),r=[],n=0,t=e.length;t>n;n++)c=e[n],c.length&&r.push(Number(c));return r}());return s.z=[s.ver||[],[s.dist]],
s.local=function(){return this.z[1].push(this.x64),this},s}}).call(t,e(20),e(17),e(7),e(19))},function(n,t,e){(function(t){n.exports=function(n){
return null==n&&(n=0),t.Quit(n)}}).call(t,e(6))},function(n,t,e){(function(t){n.exports=function(n){var e;for(e=[];!t.FolderExists(n);)e.push(n),
n=t.GetParentFolderName(n);for(;n=e.pop();)t.CreateFolder(n)}}).call(t,e(1))},function(n,t,e){(function(t,e,r){var i,o;n.exports=i=function(n){
var i;return t(i=e.BuildPath(r,n)),e.CreateTextFile(e.BuildPath(i,"nvm$.bat"),!0).WriteLine('@"%~dp0..\\cli.bat" %*'),e.FileExists(e.BuildPath(r,o))?e.CreateTextFile(e.BuildPath(i,"openssl.bat"),!0).WriteLine('@"%~dp0..\\'+o+'" %*'):void 0;
},i.openssl=o="openssl-cli.exe"}).call(t,e(10),e(1),e(3))},function(n,t,e){(function(t,e,r,i,o,s){var a;n.exports=function(){var n,o,s;
return o=[],s=a(),n=t.GetFolder(e).SubFolders,r(n,function(n){var e,r,i;if(/^(\w+)-\D*(\d+(?:[.]\d+)*)-x(\d+)/.test(n.Name))return o.push({
id:[function(){var n,t,e,r;for(e=RegExp.$2.split("."),r=[],n=0,t=e.length;t>n;n++)i=e[n],r.push(Number(i));return r}(),[e=RegExp.$1,r=/^6/.test(RegExp.$3)]],
dist:e,x64:r,path:n.Name,active:s?t.FileExists(t.BuildPath(n.Path,s.r)):void 0})}),s&&t.DeleteFile(s.p),o.sort(i.cmpi)},a=function(){
var n,e,r;if(t.FolderExists(o.link))for(n=16;--n;)if(!t.FileExists(e=t.BuildPath(o.link,r=s(15))))try{return t.CreateTextFile(e,!0).Close(),
{p:e,r:r}}catch(i){return}}}).call(t,e(1),e(3),e(13),e(7),e(5),e(37))},function(n,t){n.exports=function(n,t){var e,r,i;for("function"!=typeof t&&(i=[]),
r=0,e=new Enumerator(n);!e.atEnd();){if(i)i.push(e.item());else if(!1===t(e.item(),r++))return;e.moveNext()}return i}},function(n,t,e){
(function(t,e,r,i){var o,s,a,l,u,c,f,h;s=[],o=new t,f={},n.exports=c=function(n){var t,e,r;for(r in n)e=n[r],e.name=r,e.alias=t=e.alias?e.alias.split(/\s+/):[],
o.add({word:e.name,aliases:t}),f[e.name]=e,s.push(e);return a()},c.all=s,c.find=l=function(n){return f[o.is(n)]},a=function(){var n;
return(n=l(e[0]))||(h(),r(1)),n.cmd.call(n,e.slice(1))},c.header=u=function(){return i("nvm$ v0.4.2: Node Version Manager for M$ Windows\n");
},h=function(){return u(),i("Run nvm$ help for instructions.")}}).call(t,e(19),e(18),e(9),e(2))},function(n,t,e){(function(t,e){n.exports=function(n){
var r,i;try{return n()}catch(i){return r=i,t("ERROR: "+r.message),e(1)}}}).call(t,e(2),e(9))},function(n,t,e){(function(t,e){var r,i,o,s;
o="Path",i=t.Environment("User"),n.exports=s=function(){return i(o).split(";")},r=new Function("o,k,v","o(k)=v"),s.install=function(n){
var t,a;return null==n&&(n=!0),t=e.link,a=function(){var n,e,r,i;for(r=s(),i=[],n=0,e=r.length;e>n;n++)a=r[n],a!==t&&i.push(a);return i;
}(),n&&a.unshift(t),r(i,o,a=a.join(";"))}}).call(t,e(4),e(5))},function(n,t,e){(function(t,e,r,i,o,s,a,l,u,c,f,h,d){var v,p,m,g;n.exports=function(n){
var l,u,c,f,h,d,g;c=[];for(u in t)d=t[u],l=e.BuildPath(r,u+".tsv"),!n&&p(l)?f=e.OpenTextFile(l).ReadAll():(h=d+"index.tab",i("Fetching <"+h+">..."),
f=o.get(h),e.CreateTextFile(l,!0).WriteLine(f)),f=function(){var n,t,e,r;for(e=s(f),r=[],n=0,t=e.length;t>n;n++)g=e[n],m(g)&&r.push(new v(g,u));
return r}(),c=c.concat(f);return c.sort(a.cmpi)},p=function(n){return e.FileExists(n)&&new Date-e.GetFile(n).DateLastModified<864e5;
},m=function(n){return~n.files.indexOf("-msi")},v=function(n,t){var e,r;return e=function(){var t,e,i,o;for(i=n.version.split(/\D+/),
o=[],t=0,e=i.length;e>t;t++)r=i[t],r.length&&o.push(Number(r));return o}(),this.id=[e,[t]],this.dist=t,this.src=n,this},g=v.prototype,
g.ver=function(){return this.dist+"-"+this.src.version+"-x"+(this.x64?64:86)},g.msi=function(n){var t;return t=this.ver()+".msi",
n?e.BuildPath(r,t):t},g.uri=function(n){return null==n&&(n=this.msi(!1)),""+t[this.dist]+this.src.version+"/"+(this.x64&&!this.id[0][0]?"x64/":"")+n;
},g.fetch=function(){var n;return i("Fetching <"+(n=this.uri())+">..."),o.dl(n,this.msi(!0))},g.extract=function(){var n,t,o;return i("Extracting "+this.msi()+"..."),
e.FolderExists(t=e.BuildPath(r,o=this.ver()))&&e.DeleteFolder(t),l.Run('msiexec /a "'+this.msi(!0)+'" TARGETDIR='+t+" /passive",1,!0),
e.FolderExists(this.dst=n=e.BuildPath(u,o))&&e.DeleteFolder(n),e.MoveFolder(c(e.GetFolder(t).SubFolders).shift().Path,n),e.DeleteFolder(t);
},g.shortcuts=function(){return i("Creating shortcuts..."),"node"!==this.dist?e.CopyFile(e.BuildPath(this.dst,this.dist+".exe"),e.BuildPath(this.dst,"node.exe")):void 0;
},g.prefix=function(){var n;return i("Adjusting NPM prefix..."),n=e.OpenTextFile(e.BuildPath(this.dst,"node_modules/npm/npmrc"),8),
n.WriteLine('\n# <hack dirty src="https://github.com/ukoloff/nvms">\nprefix=${APPDATA}\\nvm$\\'+e.GetBaseName(f.link)+"\n# </hack>"),
n.Close()},g.use=function(){var n;return i("Using "+(n=this.ver())+"..."),f.exec(n)},g.install=function(n){return this.x64=null!=n?n:h,
this.fetch(),this.extract(),this.shortcuts(),this.prefix(),this.use()},g.openssl=function(n){var t,r;return this.x64=null!=n?n:h,
i("Fetching <"+(r=this.uri(t=d.openssl))+">..."),o.dl(r,e.BuildPath(u,t)),i("Creating shortcut..."),d(e.GetBaseName(f.link))}}).call(t,e(20),e(1),e(36),e(2),e(33),e(38),e(7),e(4),e(3),e(13),e(5),e(35),e(11));
},function(n,t,e){(function(t,e){n.exports=t(e.Arguments)}).call(t,e(13),e(6))},function(n,t){var e,r;n.exports=e=function(){if(!(this instanceof e))throw SyntaxError("Use new abbrev");
},r=e.prototype,r.add=function(n){var t,e,r,i,o;null==this.z&&(this.z={}),e=[];for(t in n)switch(r=n[t],t){case"word":i=r,e.push(this.z[r]=0);
break;case"words":e.push(function(){var n,t,e;for(e=[],n=0,t=r.length;t>n;n++)o=r[n],e.push(this.z[o]=i=o);return e}.call(this));break;
case"alias":e.push(this.z[r]=i);break;case"aliases":e.push(function(){var n,t,e;for(e=[],n=0,t=r.length;t>n;n++)o=r[n],e.push(this.z[o]=i);
return e}.call(this));break;default:e.push(void 0)}return e},r.is=function(n){var t,e,r,i,o;if(n&&this.z){e=this.z;for(t in e)if(i=e[t],
n===t.substring(0,n.length)){if(o=i||t,r&&r!==o)return;r=o}return r}}},function(n,t,e){n.exports={node:"https://nodejs.org/dist/",
iojs:"https://iojs.org/dist/"}},function(n,t,e){(function(t){var e;n.exports=e=function(n){return"."===n[n.length-1]?(n.pop(),!0):(e.cmd="`nvm$ "+t.join(" ")+" .`",
!1)}}).call(t,e(18))},function(n,t,e){(function(n,e){var r;t.title="Show available commands abbreviations",t.help=t.cmd=function(){
var t,i,o,s,a,l,u,c,f,h,d,v,p,m,g,x;for(n("Available abbreviations:"),m={},h=e.all,i=0,a=h.length;a>i;i++)for(g=h[i],d=[g.name].concat(g.alias),
o=0,l=d.length;l>o;o++){for(f=d[o],x=m,v=f.split(""),s=0,u=v.length;u>s;s++)t=v[s],x=x[t]||(x[t]={});x["!"]=g}return(p=function(n){
var t,e,r,i;for(t in n)r=n[t],"!"===t||(r=p(r))?("undefined"!=typeof i&&null!==i||(i=r),i!==r&&(e=!0)):e=!0;if(!e){for(t in n)delete n[t];
return n["!"]=i}})(m),(c=function(t,e){var i,o,s,a,l;for(a=r(t).sort(),s=0,o=a.length;o>s;s++)i=a[s],l=t[i],"!"===i?n("  "+e+"	"+l.name+"	"+l.title):c(l,e+i);
})(m,"")},r=function(n){var t,e;e=[];for(t in n)e.push(t);return e}}).call(t,e(2),e(14))},function(n,t,e){(function(n,e,r,i,o,s,a){
t.alias="boeing",t.title="Uninstall nvm$",t.args="[.]",t.help="Totally remove nvm$ manager and all installed Node.js versions.\n\nWithout trailing dot command does nothing.",
t.cmd=function(t){return n(t)||(e("\nSay "+n.cmd+" to really remove everything."),r(1)),e("Removing from PATH"),i.install(!1),e("Removing files..."),
o.remove(),s.DeleteFolder(a),e("\nFare thee well! and if for ever,\nStill for ever, fare thee well!\n")}}).call(t,e(21),e(2),e(9),e(16),e(5),e(1),e(3));
},function(n,t,e){(function(n,e){var r,i;t.title="Show help for all or individual commands",t.args="[command]",t.help="Shows information on individual commands or nvm$ itself.",
t.cmd=function(t){var e;return n.header(),(e=n.find(t[0]))?r(e):i()},r=function(n){return e("nvm$ "+n.name+": "+n.title),n.alias.length&&e("\nAlias: "+n.alias.join(", ")),
e("\nUsage: nvm$ "+n.name+" "+(n.args||"")+"\n"),"function"==typeof n.help?n.help():n.help?e(n.help):void 0},i=function(){var t,r,i,o;
for(e("Usage: nvm$ <command> [parameter(s)]\n\nCommands:"),i=n.all,t=0,r=i.length;r>t;t++)o=i[t],e("	"+o.name+"	"+o.title);return e("\nCommand names may be unambiguously abbreviated (See: nvm$ a).\n\nRun nvm$ help <command> for more instructions.");
}}).call(t,e(14),e(2))},function(n,t,e){(function(n,r,i,o){var s,a,l,u,c,f;s=e(8),t.alias="list",t.title="List available Node.js versions",
t.args="[remote] "+s.args,t.help="List already installed or all available to install Node.js versions",t.cmd=function(n){return/^r/i.test(n[0])?f(n.slice(1)):a(n);
},a=function(t){var e,o,a,l,u,c,f;for(u=0,e=s.parse(t).local(),c=l=n(),o=0,a=c.length;a>o;o++)f=c[o],r.match(f.id,e.z)&&(u++,i((f.active?">":"-")+" "+f.path));
u||i("Found: "+u+" of "+l.length+" installed Node.js version")},f=function(n){var t,e,a,f,h,d,v,p,m;for(t=s.parse(n),v=[],p=l(o()),
e=0,h=p.length;h>e;e++)m=p[e],r.match(m.id,t.z)&&(f&&!r.cmp(f.major,m.major)?f.minors.push(m.minor):v.push(f=m));for(a=0,d=v.length;d>a;a++)m=v[a],
i("- "+m.dist+" "+m.src.version+u(c(m.minors)))},l=function(n){var t,e,r,i;for(t=0,e=n.length;e>t;t++)i=n[t],r=i.major=i.id.slice(),
r=r[0]=r[0].slice(),i.minors=[i.minor=r.pop()];return n},c=function(n){var t,e,r,i,o;for(o=[],t=0,r=n.length;r>t;t++)i=n[t],e&&e.b+1===i?e.b=i:o.push(e={
a:i,b:i});return o},u=function(n){var t,e;return e=function(){var r,i,o;for(o=[],t=r=0,i=n.length;i>r;t=++r)e=n[t],o.push(""+(t?e.a:"")+(e.b>e.a?" - "+e.b:""));
return o}(),e.join(", ")}}).call(t,e(12),e(7),e(2),e(17))},function(n,t,e){(function(n,r){var i;i=e(8),t.title="Install OpenSSL utility",
t.args=i.args64,t.help="Install openssl.exe precompiled for Node.js project",t.cmd=function(t){var e,o,s,a,l;for(a=n().reverse(),
e=0,o=a.length;o>e;e++)if(s=a[e],r.match(s.id,[[0]])){l=s;break}if(!l)throw Error("Appropriate Node.js version not found!");return s.openssl(i.x64(t[0]));
}}).call(t,e(17),e(7))},function(n,t,e){(function(n,r,i,o,s,a,l){var u,c,f,h,d;f=e(8),t.alias="uninstall",t.title="Remove one or several Node.js version(s)",
t.args="[all] "+f.args+" [.]",t.help="Remove single specified Node.js version or all version matching filter.\n\nWithout trailing dot command only shows candidate(s) to uninstall.\n\nWith trailing dot removing will proceed without additional confirmations!",
c=!1,t.cmd=function(t){return c=n(t),/^a/i.test(t[0])?u(t.slice(1)):h(t),c?void 0:r("\nTo actually uninstall say "+n.cmd)},u=function(n){
var t,e,s,a,l,u;for(a=0,t=f.parse(n).local().z,u=i(),e=0,s=u.length;s>e;e++)l=u[e],o.match(l.id,t)&&(d(l),a++);return c?r("\nNode.js versions found & uninstalled: "+a):void 0;
},h=function(n){var t,e,r,s,a;for(t=f.parse(n).local().z,a=i(),e=0,r=a.length;r>e;e++)if(s=a[e],o.match(s.id,t))return void d(s);throw Error("Specified Node.js version not installed!");
},d=function(n){return c?(r("Removing "+n.path),s.DeleteFolder(s.BuildPath(a,n.path)),n.active?l.exec("none"):void 0):void r("Would remove "+n.path+".");
}}).call(t,e(21),e(2),e(12),e(7),e(1),e(3),e(5))},function(n,t,e){(function(n,r,i,o){var s,a;s=e(8),t.title="Use (set default) already installed Node.js version",
t.args="[ none | "+s.args+" ]",t.help="Make specified Node.js version active for all processes of current user.\n\nOnly installed versions are used. Use `nvm$ install` for new ones.\n\nSay `nvm$ use none` to temporarily disable nvm$.",
t.cmd=function(t){var e,l,u,c,f,h;if("none"===t[0])return a();for(e=s.parse(t).local().z,f=n().reverse(),l=0,u=f.length;u>l;l++)if(c=f[l],
r.match(c.id,e)){h=c;break}if(!h)throw Error("Specified Node.js version not installed!");return i("Using "+h.path),o.exec(h.path);
},a=function(){return i("Temporary disabling nvm$"),o.exec("none")}}).call(t,e(12),e(7),e(2),e(5))},function(n,t,e){(function(n){
t.title="Show version",t.help="Displays nvm$ version.",t.cmd=function(){return n("0.4.2")}}).call(t,e(2))},function(n,t,e){(function(n,e,r,i,o){
t.alias="where",t.title="Display path to current Node.js version",t.help="Shows which folder with Node.js is active for all processes of current user",
t.cmd=function(){var t,s,a,l;for(a=n(),t=0,s=a.length;s>t;t++)if(l=a[t],l.active)return void e(r.BuildPath(i,l.path));return e(o.link);
}}).call(t,e(12),e(2),e(1),e(3),e(5))},function(n,t,e){(function(n){t.alias="repo",t.title="Open homepage",t.help="Opens nvm$ repository in default browser.",
t.cmd=function(){return n.run("https://github.com/ukoloff/nvms")}}).call(t,e(4))},,function(n,t,e){(function(t){var e,r;e=["Msxml2.XMLHTTP","Microsoft.XMLHTTP"],
n.exports=r=function(){var n,t,r;for(n=0,t=e.length;t>n;n++){r=e[n];try{return new ActiveXObject(r)}catch(i){}}throw Error("AJAX not supported!");
},r.get=function(n,t){var e;if(e=r(),e.open("GET",n,!1),e.send(null),200!==e.status)throw Error("HTTP error "+e.status+": "+e.statusText);
return t?e.responseBody:e.responseText},r.dl=function(n,e){return t(e,r.get(n,!0))}}).call(t,e(34))},function(n,t){n.exports=function(n,t){
var e,r;return e=new ActiveXObject("ADODB.Stream"),e.Type=1,e.Open(),e.Write(t),e.SaveToFile(r=n,2),e.Close()}},function(n,t,e){(function(t){
n.exports=function(){try{return 0>t.RegRead("HKLM\\HARDWARE\\DESCRIPTION\\System\\CentralProcessor\\0\\Identifier").indexOf("x86");
}catch(n){}}()}).call(t,e(4))},function(n,t,e){(function(t,e,r){t(n.exports=e.BuildPath(r,"that"))}).call(t,e(10),e(1),e(3))},function(n,t){
var e,r;n.exports=r=function(n){var t;for(null==n&&(n=12),t="";t.length<n;)t+=e();return t},r["char"]=e=function(){var n;return n=Math.floor(62*Math.random()),
String.fromCharCode(n%26+"Aa0".charCodeAt(n/26))}},function(n,t){var e,r,i;n.exports=i=function(n){return e(r(n))},r=function(n){
var t,e,r,i,o,s;for(e="",t=[],o=[],s=function(t){return t.test(n),e+=RegExp.leftContext,n=RegExp.rightContext};n.length;){if(i)switch(s(/""?|$/),
RegExp.lastMatch){case'"':i=!1;continue;case'""':e+='"';continue;case"":r=!0}else{if(s(/\t|"|\r\n?|\n|$/),'"'===RegExp.lastMatch){
i=!0;continue}r="	"!==RegExp.lastMatch}t.push(e),e="",r&&(o.push(t),t=[])}return o},e=function(n){var t,e,r,i,o,s,a,l,u,c;for(c=[],
r=0,o=n.length;o>r;r++)if(a=n[r],a.length>1||a[0].length>0)if(t)for(c.push(u={}),e=i=0,s=t.length;s>i;e=++i)l=t[e],u[l]=a[e];else t=a;
return c}},function(n,t,e){(function(n){n({abbrev:e(22),bye:e(23),help:e(24),install:e(8),ls:e(25),openssl:e(26),remove:e(27),use:e(28),
version:e(29),which:e(30),www:e(31)})}).call(t,e(14))}]);
