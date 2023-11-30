init tdr= n@node@_CMOS_10

#nchannel--------------------------------------------------------------------------------------#


mask name=nch segments= {0 0.7} 
photo mask=nch thickness=1
implant Phosphorus dose=2e13<cm-2> energy=20<keV> tilt=0 rotation=0
strip Resist



#Pchannel--------------------------------------------------------------------------------------#

mask name=pch segments= {-0.7 0} 
photo mask=pch thickness=1
implant Boron dose=1e13<cm-2> energy=10<keV> tilt=0 rotation=0
strip Resist


#common annealing--------------------------------------------------------------------------------------#

diffuse temp=1100<C> time=10<s>
struct tdr=n@node@_CMOS_11


# clearing old oxide--------------------------------------------------------------------------------------#
etch cmp coord= 0.014
etch Silicon anisotropic thickness=0.014 
etch cmp coord= 0.028


#gate oxide-------------------------------------------------------------------------------------#
diffuse temperature= 900<C> time= 2.3<min> O2
deposit material= {PolySilicon} type= anisotropic thickness= 40<nm>


# Poly gate pattern/etch
mask name= gate_mask segments= {-0.395 -0.305 0.305 0.395} negative
photo mask= gate_mask
etch material= {PolySilicon} type= anisotropic thickness= 40<nm>
etch material= {Oxide} type= anisotropic thickness= 2.5<nm>
strip Resist
struct tdr= n@node@_CMOS_12

# Poly reoxidation------------------------------------------------------------
# ----------------

diffuse temperature= 900<C> time= 10.0<min>  O2
struct tdr= n@node@_CMOS_13


# DS extensions NMOS

mask name= nmos segments= {-0.7 0} 
photo mask= nmos thickness= 1
implant Arsenic dose= 1e13<cm-2> energy= 5<keV> tilt = 0 rotation = 0
strip resist

struct tdr= n@node@_CMOS_14

# DS extensions PMOS
mask name= pmos segments= {0 0.7} 
photo mask= pmos thickness= 1
implant BF2 dose= 1e13<cm-2> energy= 10<keV> tilt = 0 rotation = 0
strip Resist
diffuse temperature= 900<C> time= 8.0<s>

struct tdr= n@node@_CMOS_15



#Spaacers-----------------------------------------------------------------------------
#---------------------------------
deposit material= {Oxide} type= isotropic  time= 1 rate= {0.06}
etch    material= {Oxide} type= anisotropic time= 1 rate= {0.06}  isotropic.overetch= 0.01

struct tdr=n@node@_CMOS_16


#DS nmos
#-----------------------
mask name= Nmos segments= {-0.7 0} 
photo mask= Nmos thickness= 1
implant Arsenic dose= 5e15<cm-2> energy= 3<keV> tilt = 0 rotation = 0
strip resist
struct tdr= n@node@_CMOS_17

# DS PMOS
mask name= Pmos segments= {0 0.7} 
photo mask= Pmos thickness= 1
implant BF2 dose= 5e15<cm-2> energy= 5<keV> tilt = 0 rotation = 0
strip Resist
diffuse temperature= 900<C> time= 8.0<s>
struct tdr= n@node@_CMOS_18

#oxide etch
mask name= tr segments= {-0.7 -0.5825 -0.1175 0.1175 0.5825 0.7}  negative
photo mask=tr
etch material= {Oxide} type= anisotropic time= 1 rate= {0.01}
strip resist



#oxide etch
mask name= tr segments= {-0.7 -0.5825 -0.1175 0.1175 0.5825 0.7}  negative
photo mask=tr
etch material= {Oxide} type= anisotropic time= 1 rate= {0.01}
strip resist

#Contacts
#-----------------------------------------

mask name= tit segments= {-0.582 -0.45 -0.395 -0.305 -0.25 -0.118 0.118 0.25 0.305 0.395 0.45 0.582}
photo mask= tit
deposit material= {TiSi2} type= anisotropic time= 1 rate= {0.025}
diffuse temperature= 650<C> time= 10.0<s>

strip resist
struct tdr=n@node@_CMOS_19

exit

