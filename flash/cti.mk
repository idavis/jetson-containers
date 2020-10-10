#!make

cti-images: cti-jax-images cti-jax-8gb-images cti-nx-images cti-nano-images cti-tx1-images cti-tx2-images cti-tx2-4gb-images cti-tx2i-images 

cti-jax-images: cti-32.1-jax-bsp-v203-image cti-32.2.0-jax-bsp-v204-image cti-32.2.1-jax-bsp-agx-32.2.1-v002-image cti-32.3.1-jax-bsp-agx-32.3.1-v007-image cti-32.4.3-jax-bsp-agx-32.4.3-v001-image 
cti-jax-8gb-images: cti-32.2.1-jax-8gb-bsp-agx-32.2.1-v002-image cti-32.3.1-jax-8gb-bsp-agx-32.3.1-v007-image cti-32.4.3-jax-8gb-bsp-agx-32.4.3-v001-image 
cti-nx-images: cti-32.4.3-nx-bsp-xavier-nx-32.4.3-v003-image 
cti-nano-images: cti-32.2.1-nano-bsp-nano-32.2.1-v001-image cti-32.3.1-nano-bsp-nano-32.3.1-v005-image cti-32.4.3-nano-bsp-nano-32.4.3-v001-image 
cti-tx1-images: cti-32.2.1-tx1-bsp-tx1-32.2.1-v001-image cti-32.3.1-tx1-bsp-tx1-32.3.1-v004-image 
cti-tx2-images: cti-32.1-tx2-bsp-v125-image cti-32.2.0-tx2-bsp-v126-1-image cti-32.2.1-tx2-bsp-tx2-32.2.1-v004-image cti-32.3.1-tx2-bsp-tx2-32.3.1-v003-image cti-32.4.3-tx2-bsp-tx2-32.4.3-v002-image 
cti-tx2-4gb-images: cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-image cti-32.3.1-tx2-4gb-bsp-tx2-32.3.1-v003-image cti-32.4.3-tx2-4gb-bsp-tx2-32.4.3-v002-image 
cti-tx2i-images: cti-32.1-tx2i-bsp-v125-image cti-32.2.0-tx2i-bsp-v126-1-image cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-image cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-image cti-32.4.3-tx2i-bsp-tx2-32.4.3-v002-image 



#
# jax - Drivers / BSP
#

cti-32.1-jax-bsp-v203-image: cti-32.1-jax-bsp-v203-rogue-image cti-32.1-jax-bsp-v203-rogue-imx274-2cam-image cti-32.1-jax-bsp-v203-mimic-base-image 
cti-32.2.0-jax-bsp-v204-image: cti-32.2.0-jax-bsp-v204-rogue-image cti-32.2.0-jax-bsp-v204-rogue-imx274-2cam-image cti-32.2.0-jax-bsp-v204-mimic-base-image 
cti-32.2.1-jax-bsp-agx-32.2.1-v002-image: cti-32.2.1-jax-bsp-agx-32.2.1-v002-rogue-image cti-32.2.1-jax-bsp-agx-32.2.1-v002-rogue-imx274-2cam-image cti-32.2.1-jax-bsp-agx-32.2.1-v002-mimic-base-image 
cti-32.3.1-jax-bsp-agx-32.3.1-v007-image: cti-32.3.1-jax-bsp-agx-32.3.1-v007-rogue-image cti-32.3.1-jax-bsp-agx-32.3.1-v007-rogueX-image 
cti-32.4.3-jax-bsp-agx-32.4.3-v001-image: cti-32.4.3-jax-bsp-agx-32.4.3-v001-rogue-image cti-32.4.3-jax-bsp-agx-32.4.3-v001-rogueX-image cti-32.4.3-jax-bsp-agx-32.4.3-v001-Mimic-image 


#
# jax-8gb - Drivers / BSP
#

cti-32.2.1-jax-8gb-bsp-agx-32.2.1-v002-image: cti-32.2.1-jax-8gb-bsp-agx-32.2.1-v002-rogue-image cti-32.2.1-jax-8gb-bsp-agx-32.2.1-v002-rogue-imx274-2cam-image cti-32.2.1-jax-8gb-bsp-agx-32.2.1-v002-mimic-base-image 
cti-32.3.1-jax-8gb-bsp-agx-32.3.1-v007-image: cti-32.3.1-jax-8gb-bsp-agx-32.3.1-v007-rogue-image cti-32.3.1-jax-8gb-bsp-agx-32.3.1-v007-rogueX-image 
cti-32.4.3-jax-8gb-bsp-agx-32.4.3-v001-image: cti-32.4.3-jax-8gb-bsp-agx-32.4.3-v001-rogue-image cti-32.4.3-jax-8gb-bsp-agx-32.4.3-v001-rogueX-image cti-32.4.3-jax-8gb-bsp-agx-32.4.3-v001-Mimic-image 


#
# nx - Drivers / BSP
#

cti-32.4.3-nx-bsp-xavier-nx-32.4.3-v003-image: cti-32.4.3-nx-bsp-xavier-nx-32.4.3-v003-photon-image cti-32.4.3-nx-bsp-xavier-nx-32.4.3-v003-quark-image cti-32.4.3-nx-bsp-xavier-nx-32.4.3-v003-rudi-nx-image 


#
# nano - Drivers / BSP
#

cti-32.2.1-nano-bsp-nano-32.2.1-v001-image: cti-32.2.1-nano-bsp-nano-32.2.1-v001-photon-image 
cti-32.3.1-nano-bsp-nano-32.3.1-v005-image: cti-32.3.1-nano-bsp-nano-32.3.1-v005-photon-image cti-32.3.1-nano-bsp-nano-32.3.1-v005-quark-image 
cti-32.4.3-nano-bsp-nano-32.4.3-v001-image: cti-32.4.3-nano-bsp-nano-32.4.3-v001-photon-image cti-32.4.3-nano-bsp-nano-32.4.3-v001-quark-image 


#
# tx1 - Drivers / BSP
#

cti-32.2.1-tx1-bsp-tx1-32.2.1-v001-image: cti-32.2.1-tx1-bsp-tx1-32.2.1-v001-astro-image cti-32.2.1-tx1-bsp-tx1-32.2.1-v001-elroy-image cti-32.2.1-tx1-bsp-tx1-32.2.1-v001-spacely-base-image cti-32.2.1-tx1-bsp-tx1-32.2.1-v001-cogswell-image cti-32.2.1-tx1-bsp-tx1-32.2.1-v001-orbitty-image cti-32.2.1-tx1-bsp-tx1-32.2.1-v001-rudi-image cti-32.2.1-tx1-bsp-tx1-32.2.1-v001-sprocket-base-image 
cti-32.3.1-tx1-bsp-tx1-32.3.1-v004-image: cti-32.3.1-tx1-bsp-tx1-32.3.1-v004-astro-image cti-32.3.1-tx1-bsp-tx1-32.3.1-v004-cogswell-image cti-32.3.1-tx1-bsp-tx1-32.3.1-v004-elroy-image cti-32.3.1-tx1-bsp-tx1-32.3.1-v004-orbitty-image cti-32.3.1-tx1-bsp-tx1-32.3.1-v004-quasar-image cti-32.3.1-tx1-bsp-tx1-32.3.1-v004-rosie-image cti-32.3.1-tx1-bsp-tx1-32.3.1-v004-rudi-image cti-32.3.1-tx1-bsp-tx1-32.3.1-v004-spacely-image cti-32.3.1-tx1-bsp-tx1-32.3.1-v004-sprocket-image 


#
# tx2 - Drivers / BSP
#

cti-32.1-tx2-bsp-v125-image: cti-32.1-tx2-bsp-v125-astro-mpcie-image cti-32.1-tx2-bsp-v125-astro-usb3-image cti-32.1-tx2-bsp-v125-astro-revG+-image cti-32.1-tx2-bsp-v125-elroy-mpcie-image cti-32.1-tx2-bsp-v125-elroy-usb3-image cti-32.1-tx2-bsp-v125-elroy-revF+-image cti-32.1-tx2-bsp-v125-orbitty-image cti-32.1-tx2-bsp-v125-rosie-image cti-32.1-tx2-bsp-v125-rudi-mpcie-image cti-32.1-tx2-bsp-v125-rudi-usb3-image cti-32.1-tx2-bsp-v125-rudi-image cti-32.1-tx2-bsp-v125-sprocket-image cti-32.1-tx2-bsp-v125-spacely-base-image cti-32.1-tx2-bsp-v125-spacely-imx185-6cam-image cti-32.1-tx2-bsp-v125-spacely-imx185-3cam-image cti-32.1-tx2-bsp-v125-spacely-imx274-6cam-image cti-32.1-tx2-bsp-v125-spacely-imx274-3cam-image cti-32.1-tx2-bsp-v125-cogswell-image cti-32.1-tx2-bsp-v125-vpg003-base-image 
cti-32.2.0-tx2-bsp-v126-1-image: cti-32.2.0-tx2-bsp-v126-1-astro-mpcie-image cti-32.2.0-tx2-bsp-v126-1-astro-revG+-image cti-32.2.0-tx2-bsp-v126-1-astro-usb3-image cti-32.2.0-tx2-bsp-v126-1-cogswell-image cti-32.2.0-tx2-bsp-v126-1-elroy-mpcie-image cti-32.2.0-tx2-bsp-v126-1-elroy-revF+-image cti-32.2.0-tx2-bsp-v126-1-elroy-usb3-image cti-32.2.0-tx2-bsp-v126-1-orbitty-image cti-32.2.0-tx2-bsp-v126-1-quasar-base-image cti-32.2.0-tx2-bsp-v126-1-quasar-imx185-image cti-32.2.0-tx2-bsp-v126-1-quasar-imx274-image cti-32.2.0-tx2-bsp-v126-1-rosie-image cti-32.2.0-tx2-bsp-v126-1-rudi-image cti-32.2.0-tx2-bsp-v126-1-rudi-mpcie-image cti-32.2.0-tx2-bsp-v126-1-rudi-usb3-image cti-32.2.0-tx2-bsp-v126-1-spacely-base-image cti-32.2.0-tx2-bsp-v126-1-spacely-imx185-3cam-image cti-32.2.0-tx2-bsp-v126-1-spacely-imx185-6cam-image cti-32.2.0-tx2-bsp-v126-1-spacely-imx274-3cam-image cti-32.2.0-tx2-bsp-v126-1-spacely-imx274-6cam-image cti-32.2.0-tx2-bsp-v126-1-sprocket-image cti-32.2.0-tx2-bsp-v126-1-sprocket-imx185-image cti-32.2.0-tx2-bsp-v126-1-sprocket-imx274-image cti-32.2.0-tx2-bsp-v126-1-vpg003-image cti-32.2.0-tx2-bsp-v126-1-vpg003-imx185-3cam-image cti-32.2.0-tx2-bsp-v126-1-vpg003-imx274-3cam-image 
cti-32.2.1-tx2-bsp-tx2-32.2.1-v004-image: cti-32.2.1-tx2-bsp-tx2-32.2.1-v004-astro-mpcie-image cti-32.2.1-tx2-bsp-tx2-32.2.1-v004-astro-revG+-image cti-32.2.1-tx2-bsp-tx2-32.2.1-v004-astro-usb3-image cti-32.2.1-tx2-bsp-tx2-32.2.1-v004-cogswell-image cti-32.2.1-tx2-bsp-tx2-32.2.1-v004-elroy-mpcie-image cti-32.2.1-tx2-bsp-tx2-32.2.1-v004-elroy-revF+-image cti-32.2.1-tx2-bsp-tx2-32.2.1-v004-elroy-usb3-image cti-32.2.1-tx2-bsp-tx2-32.2.1-v004-orbitty-image cti-32.2.1-tx2-bsp-tx2-32.2.1-v004-quasar-base-image cti-32.2.1-tx2-bsp-tx2-32.2.1-v004-quasar-imx185-image cti-32.2.1-tx2-bsp-tx2-32.2.1-v004-quasar-imx274-image cti-32.2.1-tx2-bsp-tx2-32.2.1-v004-rosie-image cti-32.2.1-tx2-bsp-tx2-32.2.1-v004-rudi-image cti-32.2.1-tx2-bsp-tx2-32.2.1-v004-rudi-mpcie-image cti-32.2.1-tx2-bsp-tx2-32.2.1-v004-rudi-usb3-image cti-32.2.1-tx2-bsp-tx2-32.2.1-v004-spacely-base-image cti-32.2.1-tx2-bsp-tx2-32.2.1-v004-spacely-imx185-3cam-image cti-32.2.1-tx2-bsp-tx2-32.2.1-v004-spacely-imx185-6cam-image cti-32.2.1-tx2-bsp-tx2-32.2.1-v004-spacely-imx274-3cam-image cti-32.2.1-tx2-bsp-tx2-32.2.1-v004-spacely-imx274-6cam-image cti-32.2.1-tx2-bsp-tx2-32.2.1-v004-sprocket-image cti-32.2.1-tx2-bsp-tx2-32.2.1-v004-sprocket-imx185-image cti-32.2.1-tx2-bsp-tx2-32.2.1-v004-sprocket-imx274-image cti-32.2.1-tx2-bsp-tx2-32.2.1-v004-vpg003-image cti-32.2.1-tx2-bsp-tx2-32.2.1-v004-vpg003-imx185-3cam-image cti-32.2.1-tx2-bsp-tx2-32.2.1-v004-vpg003-imx274-3cam-image 
cti-32.3.1-tx2-bsp-tx2-32.3.1-v003-image: cti-32.3.1-tx2-bsp-tx2-32.3.1-v003-astro-mpcie-image cti-32.3.1-tx2-bsp-tx2-32.3.1-v003-astro-revG+-image cti-32.3.1-tx2-bsp-tx2-32.3.1-v003-astro-usb3-image cti-32.3.1-tx2-bsp-tx2-32.3.1-v003-cogswell-image cti-32.3.1-tx2-bsp-tx2-32.3.1-v003-elroy-mpcie-image cti-32.3.1-tx2-bsp-tx2-32.3.1-v003-elroy-revF+-image cti-32.3.1-tx2-bsp-tx2-32.3.1-v003-elroy-usb3-image cti-32.3.1-tx2-bsp-tx2-32.3.1-v003-orbitty-image cti-32.3.1-tx2-bsp-tx2-32.3.1-v003-quasar-imx185-image cti-32.3.1-tx2-bsp-tx2-32.3.1-v003-quasar-imx274-image cti-32.3.1-tx2-bsp-tx2-32.3.1-v003-quasar-image cti-32.3.1-tx2-bsp-tx2-32.3.1-v003-rosie-image cti-32.3.1-tx2-bsp-tx2-32.3.1-v003-rudi-mpcie-image cti-32.3.1-tx2-bsp-tx2-32.3.1-v003-rudi-usb3-image cti-32.3.1-tx2-bsp-tx2-32.3.1-v003-rudi-image cti-32.3.1-tx2-bsp-tx2-32.3.1-v003-spacely-imx185-3cam-image cti-32.3.1-tx2-bsp-tx2-32.3.1-v003-spacely-imx185-6cam-image cti-32.3.1-tx2-bsp-tx2-32.3.1-v003-spacely-imx274-3cam-image cti-32.3.1-tx2-bsp-tx2-32.3.1-v003-spacely-imx274-6cam-image cti-32.3.1-tx2-bsp-tx2-32.3.1-v003-spacely-image cti-32.3.1-tx2-bsp-tx2-32.3.1-v003-sprocket-imx185-image cti-32.3.1-tx2-bsp-tx2-32.3.1-v003-sprocket-imx274-image cti-32.3.1-tx2-bsp-tx2-32.3.1-v003-sprocket-image cti-32.3.1-tx2-bsp-tx2-32.3.1-v003-vpg003-imx185-3cam-image cti-32.3.1-tx2-bsp-tx2-32.3.1-v003-vpg003-imx274-3cam-image cti-32.3.1-tx2-bsp-tx2-32.3.1-v003-vpg003-image 
cti-32.4.3-tx2-bsp-tx2-32.4.3-v002-image: cti-32.4.3-tx2-bsp-tx2-32.4.3-v002-astro-mpcie-image cti-32.4.3-tx2-bsp-tx2-32.4.3-v002-astro-revG+-image cti-32.4.3-tx2-bsp-tx2-32.4.3-v002-astro-usb3-image cti-32.4.3-tx2-bsp-tx2-32.4.3-v002-cogswell-image cti-32.4.3-tx2-bsp-tx2-32.4.3-v002-elroy-mpcie-image cti-32.4.3-tx2-bsp-tx2-32.4.3-v002-elroy-revF+-image cti-32.4.3-tx2-bsp-tx2-32.4.3-v002-elroy-usb3-image cti-32.4.3-tx2-bsp-tx2-32.4.3-v002-orbitty-image cti-32.4.3-tx2-bsp-tx2-32.4.3-v002-quasar-imx185-image cti-32.4.3-tx2-bsp-tx2-32.4.3-v002-quasar-imx274-image cti-32.4.3-tx2-bsp-tx2-32.4.3-v002-quasar-image cti-32.4.3-tx2-bsp-tx2-32.4.3-v002-rosie-image cti-32.4.3-tx2-bsp-tx2-32.4.3-v002-rudi-mpcie-image cti-32.4.3-tx2-bsp-tx2-32.4.3-v002-rudi-usb3-image cti-32.4.3-tx2-bsp-tx2-32.4.3-v002-rudi-image cti-32.4.3-tx2-bsp-tx2-32.4.3-v002-spacely-imx185-3cam-image cti-32.4.3-tx2-bsp-tx2-32.4.3-v002-spacely-imx185-6cam-image cti-32.4.3-tx2-bsp-tx2-32.4.3-v002-spacely-imx274-3cam-image cti-32.4.3-tx2-bsp-tx2-32.4.3-v002-spacely-imx274-6cam-image cti-32.4.3-tx2-bsp-tx2-32.4.3-v002-spacely-image cti-32.4.3-tx2-bsp-tx2-32.4.3-v002-sprocket-imx185-image cti-32.4.3-tx2-bsp-tx2-32.4.3-v002-sprocket-imx274-image cti-32.4.3-tx2-bsp-tx2-32.4.3-v002-sprocket-image cti-32.4.3-tx2-bsp-tx2-32.4.3-v002-vpg003-imx274-2cam-image cti-32.4.3-tx2-bsp-tx2-32.4.3-v002-vpg003-image 


#
# tx2-4gb - Drivers / BSP
#

cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-image: cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-astro-mpcie-image cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-astro-revG+-image cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-astro-usb3-image cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-cogswell-image cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-elroy-mpcie-image cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-elroy-revF+-image cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-elroy-usb3-image cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-orbitty-image cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-quasar-base-image cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-quasar-imx185-image cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-quasar-imx274-image cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-rosie-image cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-rudi-image cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-rudi-mpcie-image cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-rudi-usb3-image cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-spacely-base-image cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-spacely-imx185-3cam-image cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-spacely-imx185-6cam-image cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-spacely-imx274-3cam-image cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-spacely-imx274-6cam-image cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-sprocket-base-image cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-sprocket-image cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-sprocket-imx185-image cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-sprocket-imx274-image cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-vpg003-image cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-vpg003-imx185-3cam-image cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-vpg003-imx274-3cam-image 
cti-32.3.1-tx2-4gb-bsp-tx2-32.3.1-v003-image: cti-32.3.1-tx2-4gb-bsp-tx2-32.3.1-v003-astro-mpcie-image cti-32.3.1-tx2-4gb-bsp-tx2-32.3.1-v003-astro-revG+-image cti-32.3.1-tx2-4gb-bsp-tx2-32.3.1-v003-astro-usb3-image cti-32.3.1-tx2-4gb-bsp-tx2-32.3.1-v003-cogswell-image cti-32.3.1-tx2-4gb-bsp-tx2-32.3.1-v003-elroy-mpcie-image cti-32.3.1-tx2-4gb-bsp-tx2-32.3.1-v003-elroy-revF+-image cti-32.3.1-tx2-4gb-bsp-tx2-32.3.1-v003-elroy-usb3-image cti-32.3.1-tx2-4gb-bsp-tx2-32.3.1-v003-orbitty-image cti-32.3.1-tx2-4gb-bsp-tx2-32.3.1-v003-quasar-imx185-image cti-32.3.1-tx2-4gb-bsp-tx2-32.3.1-v003-quasar-imx274-image cti-32.3.1-tx2-4gb-bsp-tx2-32.3.1-v003-quasar-image cti-32.3.1-tx2-4gb-bsp-tx2-32.3.1-v003-rosie-image cti-32.3.1-tx2-4gb-bsp-tx2-32.3.1-v003-rudi-mpcie-image cti-32.3.1-tx2-4gb-bsp-tx2-32.3.1-v003-rudi-usb3-image cti-32.3.1-tx2-4gb-bsp-tx2-32.3.1-v003-rudi-image cti-32.3.1-tx2-4gb-bsp-tx2-32.3.1-v003-spacely-imx185-3cam-image cti-32.3.1-tx2-4gb-bsp-tx2-32.3.1-v003-spacely-imx185-6cam-image cti-32.3.1-tx2-4gb-bsp-tx2-32.3.1-v003-spacely-imx274-3cam-image cti-32.3.1-tx2-4gb-bsp-tx2-32.3.1-v003-spacely-imx274-6cam-image cti-32.3.1-tx2-4gb-bsp-tx2-32.3.1-v003-spacely-image cti-32.3.1-tx2-4gb-bsp-tx2-32.3.1-v003-sprocket-imx185-image cti-32.3.1-tx2-4gb-bsp-tx2-32.3.1-v003-sprocket-imx274-image cti-32.3.1-tx2-4gb-bsp-tx2-32.3.1-v003-sprocket-image cti-32.3.1-tx2-4gb-bsp-tx2-32.3.1-v003-vpg003-imx185-3cam-image cti-32.3.1-tx2-4gb-bsp-tx2-32.3.1-v003-vpg003-imx274-3cam-image cti-32.3.1-tx2-4gb-bsp-tx2-32.3.1-v003-vpg003-image 
cti-32.4.3-tx2-4gb-bsp-tx2-32.4.3-v002-image: cti-32.4.3-tx2-4gb-bsp-tx2-32.4.3-v002-astro-mpcie-image cti-32.4.3-tx2-4gb-bsp-tx2-32.4.3-v002-astro-revG+-image cti-32.4.3-tx2-4gb-bsp-tx2-32.4.3-v002-astro-usb3-image cti-32.4.3-tx2-4gb-bsp-tx2-32.4.3-v002-cogswell-image cti-32.4.3-tx2-4gb-bsp-tx2-32.4.3-v002-elroy-mpcie-image cti-32.4.3-tx2-4gb-bsp-tx2-32.4.3-v002-elroy-revF+-image cti-32.4.3-tx2-4gb-bsp-tx2-32.4.3-v002-elroy-usb3-image cti-32.4.3-tx2-4gb-bsp-tx2-32.4.3-v002-orbitty-image cti-32.4.3-tx2-4gb-bsp-tx2-32.4.3-v002-quasar-imx185-image cti-32.4.3-tx2-4gb-bsp-tx2-32.4.3-v002-quasar-imx274-image cti-32.4.3-tx2-4gb-bsp-tx2-32.4.3-v002-quasar-image cti-32.4.3-tx2-4gb-bsp-tx2-32.4.3-v002-rosie-image cti-32.4.3-tx2-4gb-bsp-tx2-32.4.3-v002-rudi-image cti-32.4.3-tx2-4gb-bsp-tx2-32.4.3-v002-spacely-imx185-3cam-image cti-32.4.3-tx2-4gb-bsp-tx2-32.4.3-v002-spacely-imx185-6cam-image cti-32.4.3-tx2-4gb-bsp-tx2-32.4.3-v002-spacely-imx274-3cam-image cti-32.4.3-tx2-4gb-bsp-tx2-32.4.3-v002-spacely-imx274-6cam-image cti-32.4.3-tx2-4gb-bsp-tx2-32.4.3-v002-spacely-image cti-32.4.3-tx2-4gb-bsp-tx2-32.4.3-v002-sprocket-imx185-image cti-32.4.3-tx2-4gb-bsp-tx2-32.4.3-v002-sprocket-imx274-image cti-32.4.3-tx2-4gb-bsp-tx2-32.4.3-v002-sprocket-image cti-32.4.3-tx2-4gb-bsp-tx2-32.4.3-v002-vpg003-image 


#
# tx2i - Drivers / BSP
#

cti-32.1-tx2i-bsp-v125-image: cti-32.1-tx2i-bsp-v125-astro-mpcie-tx2i-image cti-32.1-tx2i-bsp-v125-astro-usb3-tx2i-image cti-32.1-tx2i-bsp-v125-astro-revG+-tx2i-image cti-32.1-tx2i-bsp-v125-elroy-mpcie-tx2i-image cti-32.1-tx2i-bsp-v125-elroy-usb3-tx2i-image cti-32.1-tx2i-bsp-v125-elroy-refF+-tx2i-image cti-32.1-tx2i-bsp-v125-orbitty-tx2i-image cti-32.1-tx2i-bsp-v125-rosie-tx2i-image cti-32.1-tx2i-bsp-v125-rudi-mpcie-tx2i-image cti-32.1-tx2i-bsp-v125-rudi-usb3-tx2i-image cti-32.1-tx2i-bsp-v125-rudi-tx2i-image cti-32.1-tx2i-bsp-v125-spacely-base-tx2i-image cti-32.1-tx2i-bsp-v125-spacely-imx185-6cam-tx2i-image cti-32.1-tx2i-bsp-v125-spacely-imx185-3cam-tx2i-image cti-32.1-tx2i-bsp-v125-spacely-imx274-6cam-tx2i-image cti-32.1-tx2i-bsp-v125-spacely-imx274-3cam-tx2i-image cti-32.1-tx2i-bsp-v125-cogswell-tx2i-image cti-32.1-tx2i-bsp-v125-vpg003-base-tx2i-image 
cti-32.2.0-tx2i-bsp-v126-1-image: cti-32.2.0-tx2i-bsp-v126-1-astro-mpcie-image cti-32.2.0-tx2i-bsp-v126-1-astro-revG+-image cti-32.2.0-tx2i-bsp-v126-1-astro-usb3-image cti-32.2.0-tx2i-bsp-v126-1-astro-usb-image cti-32.2.0-tx2i-bsp-v126-1-cogswell-image cti-32.2.0-tx2i-bsp-v126-1-elroy-mpcie-image cti-32.2.0-tx2i-bsp-v126-1-elroy-revF+-image cti-32.2.0-tx2i-bsp-v126-1-elroy-usb3-image cti-32.2.0-tx2i-bsp-v126-1-orbitty-base-image cti-32.2.0-tx2i-bsp-v126-1-orbitty-image cti-32.2.0-tx2i-bsp-v126-1-quasar-base-image cti-32.2.0-tx2i-bsp-v126-1-quasar-imx185-image cti-32.2.0-tx2i-bsp-v126-1-quasar-imx274-image cti-32.2.0-tx2i-bsp-v126-1-rosie-image cti-32.2.0-tx2i-bsp-v126-1-rudi-base-image cti-32.2.0-tx2i-bsp-v126-1-rudi-image cti-32.2.0-tx2i-bsp-v126-1-rudi-mpcie-image cti-32.2.0-tx2i-bsp-v126-1-rudi-usb3-image cti-32.2.0-tx2i-bsp-v126-1-spacely-base-image cti-32.2.0-tx2i-bsp-v126-1-spacely-imx185-3cam-image cti-32.2.0-tx2i-bsp-v126-1-spacely-imx185-6cam-image cti-32.2.0-tx2i-bsp-v126-1-spacely-imx274-3cam-image cti-32.2.0-tx2i-bsp-v126-1-spacely-imx274-6cam-image cti-32.2.0-tx2i-bsp-v126-1-sprocket-base-image cti-32.2.0-tx2i-bsp-v126-1-sprocket-image cti-32.2.0-tx2i-bsp-v126-1-sprocket-imx185-image cti-32.2.0-tx2i-bsp-v126-1-sprocket-imx274-image cti-32.2.0-tx2i-bsp-v126-1-vpg003-image cti-32.2.0-tx2i-bsp-v126-1-vpg003-imx185-3cam-image cti-32.2.0-tx2i-bsp-v126-1-vpg003-imx274-3cam-image 
cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-image: cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-astro-mpcie-image cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-astro-revG+-image cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-astro-usb3-image cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-astro-usb-image cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-cogswell-image cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-elroy-mpcie-image cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-elroy-revF+-image cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-elroy-usb3-image cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-orbitty-base-image cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-orbitty-image cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-quasar-base-image cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-quasar-imx185-image cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-quasar-imx274-image cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-rosie-image cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-rudi-image cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-rudi-mpcie-image cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-rudi-usb3-image cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-spacely-base-image cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-spacely-imx185-3cam-image cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-spacely-imx185-6cam-image cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-spacely-imx274-3cam-image cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-spacely-imx274-6cam-image cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-sprocket-base-image cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-sprocket-image cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-sprocket-imx185-image cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-sprocket-imx274-image cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-vpg003-image cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-vpg003-imx185-3cam-image cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-vpg003-imx274-3cam-image 
cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-image: cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-astro-mpcie-image cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-astro-revG+-image cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-astro-usb-image cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-astro-usb3-image cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-cogswell-image cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-elroy-mpcie-image cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-elroy-revF+-image cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-elroy-usb3-image cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-orbitty-base-image cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-orbitty-image cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-quasar-imx185-image cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-quasar-imx274-image cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-quasar-image cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-rosie-image cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-rudi-mpcie-image cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-rudi-usb3-image cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-rudi-image cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-spacely-imx185-3cam-image cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-spacely-imx185-6cam-image cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-spacely-imx274-3cam-image cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-spacely-imx274-6cam-image cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-spacely-image cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-sprocket-imx185-image cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-sprocket-imx274-image cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-sprocket-image cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-vpg003-imx185-3cam-image cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-vpg003-imx274-3cam-image cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-vpg003-image 
cti-32.4.3-tx2i-bsp-tx2-32.4.3-v002-image: cti-32.4.3-tx2i-bsp-tx2-32.4.3-v002-astro-mpcie-image cti-32.4.3-tx2i-bsp-tx2-32.4.3-v002-astro-revG+-image cti-32.4.3-tx2i-bsp-tx2-32.4.3-v002-astro-usb3-image cti-32.4.3-tx2i-bsp-tx2-32.4.3-v002-cogswell-image cti-32.4.3-tx2i-bsp-tx2-32.4.3-v002-elroy-mpcie-image cti-32.4.3-tx2i-bsp-tx2-32.4.3-v002-elroy-revF+-image cti-32.4.3-tx2i-bsp-tx2-32.4.3-v002-elroy-usb3-image cti-32.4.3-tx2i-bsp-tx2-32.4.3-v002-orbitty-image cti-32.4.3-tx2i-bsp-tx2-32.4.3-v002-quasar-imx185-image cti-32.4.3-tx2i-bsp-tx2-32.4.3-v002-quasar-imx274-image cti-32.4.3-tx2i-bsp-tx2-32.4.3-v002-quasar-image cti-32.4.3-tx2i-bsp-tx2-32.4.3-v002-rosie-image cti-32.4.3-tx2i-bsp-tx2-32.4.3-v002-rudi-mpcie-image cti-32.4.3-tx2i-bsp-tx2-32.4.3-v002-rudi-usb3-image cti-32.4.3-tx2i-bsp-tx2-32.4.3-v002-rudi-image cti-32.4.3-tx2i-bsp-tx2-32.4.3-v002-spacely-imx185-3cam-image cti-32.4.3-tx2i-bsp-tx2-32.4.3-v002-spacely-imx185-6cam-image cti-32.4.3-tx2i-bsp-tx2-32.4.3-v002-spacely-imx274-3cam-image cti-32.4.3-tx2i-bsp-tx2-32.4.3-v002-spacely-imx274-6cam-image cti-32.4.3-tx2i-bsp-tx2-32.4.3-v002-spacely-image cti-32.4.3-tx2i-bsp-tx2-32.4.3-v002-sprocket-imx185-image cti-32.4.3-tx2i-bsp-tx2-32.4.3-v002-sprocket-imx274-image cti-32.4.3-tx2i-bsp-tx2-32.4.3-v002-sprocket-image cti-32.4.3-tx2i-bsp-tx2-32.4.3-v002-vpg003-image 





#
# jax - Device Level
#


# Device: L4T: 32.1 - BSP: V203

cti-32.1-jax-bsp-v203-rogue-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.1" TARGET_BOARD="rogue" $(CURDIR)/build.sh $(CURDIR)/cti/32.1/conf/32.1-jax-jetpack-4.2-bsp-v203-image $(subst +,plus,$(REPO):$@))

cti-32.1-jax-bsp-v203-rogue-imx274-2cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.1" TARGET_BOARD="rogue-imx274-2cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.1/conf/32.1-jax-jetpack-4.2-bsp-v203-image $(subst +,plus,$(REPO):$@))

cti-32.1-jax-bsp-v203-mimic-base-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.1" TARGET_BOARD="mimic-base" $(CURDIR)/build.sh $(CURDIR)/cti/32.1/conf/32.1-jax-jetpack-4.2-bsp-v203-image $(subst +,plus,$(REPO):$@))


# Device: L4T: 32.2.0 - BSP: V204

cti-32.2.0-jax-bsp-v204-rogue-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/xavier/rogue" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-jax-jetpack-4.2.1-bsp-v204-image $(subst +,plus,$(REPO):$@))

cti-32.2.0-jax-bsp-v204-rogue-imx274-2cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/xavier/rogue-imx274-2cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-jax-jetpack-4.2.1-bsp-v204-image $(subst +,plus,$(REPO):$@))

cti-32.2.0-jax-bsp-v204-mimic-base-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/xavier/mimic-base" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-jax-jetpack-4.2.1-bsp-v204-image $(subst +,plus,$(REPO):$@))


# Device: L4T: 32.2.1 - BSP: AGX-32.2.1-V002

cti-32.2.1-jax-bsp-agx-32.2.1-v002-rogue-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="rogue" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-jax-jetpack-4.2.2-bsp-agx-32.2.1-v002-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-jax-bsp-agx-32.2.1-v002-rogue-imx274-2cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="rogue-imx274-2cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-jax-jetpack-4.2.2-bsp-agx-32.2.1-v002-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-jax-bsp-agx-32.2.1-v002-mimic-base-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="mimic-base" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-jax-jetpack-4.2.2-bsp-agx-32.2.1-v002-image $(subst +,plus,$(REPO):$@))


# Device: L4T: 32.3.1 - BSP: AGX-32.3.1-V007

cti-32.3.1-jax-bsp-agx-32.3.1-v007-rogue-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/xavier/rogue" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-jax-jetpack-4.3-bsp-agx-32.3.1-v007-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-jax-bsp-agx-32.3.1-v007-rogueX-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/xavier/rogueX" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-jax-jetpack-4.3-bsp-agx-32.3.1-v007-image $(subst +,plus,$(REPO):$@))


# Device: L4T: 32.4.3 - BSP: AGX-32.4.3-V001

cti-32.4.3-jax-bsp-agx-32.4.3-v001-rogue-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/xavier/rogue" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-jax-jetpack-4.4-bsp-agx-32.4.3-v001-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-jax-bsp-agx-32.4.3-v001-rogueX-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/xavier/rogueX" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-jax-jetpack-4.4-bsp-agx-32.4.3-v001-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-jax-bsp-agx-32.4.3-v001-Mimic-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/xavier/Mimic" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-jax-jetpack-4.4-bsp-agx-32.4.3-v001-image $(subst +,plus,$(REPO):$@))



#
# jax-8gb - Device Level
#


# Device: L4T: 32.2.1 - BSP: AGX-32.2.1-V002

cti-32.2.1-jax-8gb-bsp-agx-32.2.1-v002-rogue-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="rogue" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-jax-8gb-jetpack-4.2.2-bsp-agx-32.2.1-v002-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-jax-8gb-bsp-agx-32.2.1-v002-rogue-imx274-2cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="rogue-imx274-2cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-jax-8gb-jetpack-4.2.2-bsp-agx-32.2.1-v002-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-jax-8gb-bsp-agx-32.2.1-v002-mimic-base-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="mimic-base" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-jax-8gb-jetpack-4.2.2-bsp-agx-32.2.1-v002-image $(subst +,plus,$(REPO):$@))


# Device: L4T: 32.3.1 - BSP: AGX-32.3.1-V007

cti-32.3.1-jax-8gb-bsp-agx-32.3.1-v007-rogue-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/xavier-8G/rogue" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-jax-8gb-jetpack-4.3-bsp-agx-32.3.1-v007-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-jax-8gb-bsp-agx-32.3.1-v007-rogueX-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/xavier-8G/rogueX" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-jax-8gb-jetpack-4.3-bsp-agx-32.3.1-v007-image $(subst +,plus,$(REPO):$@))


# Device: L4T: 32.4.3 - BSP: AGX-32.4.3-V001

cti-32.4.3-jax-8gb-bsp-agx-32.4.3-v001-rogue-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/xavier-8G/rogue" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-jax-8gb-jetpack-4.4-bsp-agx-32.4.3-v001-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-jax-8gb-bsp-agx-32.4.3-v001-rogueX-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/xavier-8G/rogueX" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-jax-8gb-jetpack-4.4-bsp-agx-32.4.3-v001-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-jax-8gb-bsp-agx-32.4.3-v001-Mimic-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/xavier-8G/Mimic" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-jax-8gb-jetpack-4.4-bsp-agx-32.4.3-v001-image $(subst +,plus,$(REPO):$@))



#
# nx - Device Level
#


# Device: L4T: 32.4.3 - BSP: XAVIER-NX-32.4.3-V003

cti-32.4.3-nx-bsp-xavier-nx-32.4.3-v003-photon-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/Xavier-NX/photon" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-nx-jetpack-4.4-bsp-xavier-nx-32.4.3-v003-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-nx-bsp-xavier-nx-32.4.3-v003-quark-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/Xavier-NX/quark" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-nx-jetpack-4.4-bsp-xavier-nx-32.4.3-v003-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-nx-bsp-xavier-nx-32.4.3-v003-rudi-nx-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/Xavier-NX/rudi-nx" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-nx-jetpack-4.4-bsp-xavier-nx-32.4.3-v003-image $(subst +,plus,$(REPO):$@))



#
# nano - Device Level
#


# Device: L4T: 32.2.1 - BSP: NANO-32.2.1-V001

cti-32.2.1-nano-bsp-nano-32.2.1-v001-photon-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/nano/photon" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-nano-jetpack-4.2.2-bsp-nano-32.2.1-v001-image $(subst +,plus,$(REPO):$@))


# Device: L4T: 32.3.1 - BSP: NANO-32.3.1-V005

cti-32.3.1-nano-bsp-nano-32.3.1-v005-photon-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/nano/photon" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-nano-jetpack-4.3-bsp-nano-32.3.1-v005-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-nano-bsp-nano-32.3.1-v005-quark-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/nano/quark" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-nano-jetpack-4.3-bsp-nano-32.3.1-v005-image $(subst +,plus,$(REPO):$@))


# Device: L4T: 32.4.3 - BSP: NANO-32.4.3-V001

cti-32.4.3-nano-bsp-nano-32.4.3-v001-photon-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/nano/photon" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-nano-jetpack-4.4-bsp-nano-32.4.3-v001-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-nano-bsp-nano-32.4.3-v001-quark-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/nano/quark" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-nano-jetpack-4.4-bsp-nano-32.4.3-v001-image $(subst +,plus,$(REPO):$@))



#
# tx1 - Device Level
#


# Device: L4T: 32.2.1 - BSP: TX1-32.2.1-V001

cti-32.2.1-tx1-bsp-tx1-32.2.1-v001-astro-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/astro" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx1-jetpack-4.2.2-bsp-tx1-32.2.1-v001-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx1-bsp-tx1-32.2.1-v001-elroy-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/elroy" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx1-jetpack-4.2.2-bsp-tx1-32.2.1-v001-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx1-bsp-tx1-32.2.1-v001-spacely-base-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/spacely-base" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx1-jetpack-4.2.2-bsp-tx1-32.2.1-v001-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx1-bsp-tx1-32.2.1-v001-cogswell-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/cogswell" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx1-jetpack-4.2.2-bsp-tx1-32.2.1-v001-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx1-bsp-tx1-32.2.1-v001-orbitty-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/orbitty" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx1-jetpack-4.2.2-bsp-tx1-32.2.1-v001-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx1-bsp-tx1-32.2.1-v001-rudi-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/rudi" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx1-jetpack-4.2.2-bsp-tx1-32.2.1-v001-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx1-bsp-tx1-32.2.1-v001-sprocket-base-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/sprocket-base" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx1-jetpack-4.2.2-bsp-tx1-32.2.1-v001-image $(subst +,plus,$(REPO):$@))


# Device: L4T: 32.3.1 - BSP: TX1-32.3.1-V004

cti-32.3.1-tx1-bsp-tx1-32.3.1-v004-astro-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx1/astro" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx1-jetpack-4.3-bsp-tx1-32.3.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx1-bsp-tx1-32.3.1-v004-cogswell-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx1/cogswell" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx1-jetpack-4.3-bsp-tx1-32.3.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx1-bsp-tx1-32.3.1-v004-elroy-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx1/elroy" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx1-jetpack-4.3-bsp-tx1-32.3.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx1-bsp-tx1-32.3.1-v004-orbitty-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx1/orbitty" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx1-jetpack-4.3-bsp-tx1-32.3.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx1-bsp-tx1-32.3.1-v004-quasar-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx1/quasar" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx1-jetpack-4.3-bsp-tx1-32.3.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx1-bsp-tx1-32.3.1-v004-rosie-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx1/rosie" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx1-jetpack-4.3-bsp-tx1-32.3.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx1-bsp-tx1-32.3.1-v004-rudi-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx1/rudi" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx1-jetpack-4.3-bsp-tx1-32.3.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx1-bsp-tx1-32.3.1-v004-spacely-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx1/spacely" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx1-jetpack-4.3-bsp-tx1-32.3.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx1-bsp-tx1-32.3.1-v004-sprocket-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx1/sprocket" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx1-jetpack-4.3-bsp-tx1-32.3.1-v004-image $(subst +,plus,$(REPO):$@))



#
# tx2 - Device Level
#


# Device: L4T: 32.1 - BSP: V125

cti-32.1-tx2-bsp-v125-astro-mpcie-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.1" TARGET_BOARD="astro-mpcie" $(CURDIR)/build.sh $(CURDIR)/cti/32.1/conf/32.1-tx2-jetpack-4.2-bsp-v125-image $(subst +,plus,$(REPO):$@))

cti-32.1-tx2-bsp-v125-astro-usb3-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.1" TARGET_BOARD="astro-usb3" $(CURDIR)/build.sh $(CURDIR)/cti/32.1/conf/32.1-tx2-jetpack-4.2-bsp-v125-image $(subst +,plus,$(REPO):$@))

cti-32.1-tx2-bsp-v125-astro-revG+-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.1" TARGET_BOARD="astro-revG+" $(CURDIR)/build.sh $(CURDIR)/cti/32.1/conf/32.1-tx2-jetpack-4.2-bsp-v125-image $(subst +,plus,$(REPO):$@))

cti-32.1-tx2-bsp-v125-elroy-mpcie-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.1" TARGET_BOARD="elroy-mpcie" $(CURDIR)/build.sh $(CURDIR)/cti/32.1/conf/32.1-tx2-jetpack-4.2-bsp-v125-image $(subst +,plus,$(REPO):$@))

cti-32.1-tx2-bsp-v125-elroy-usb3-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.1" TARGET_BOARD="elroy-usb3" $(CURDIR)/build.sh $(CURDIR)/cti/32.1/conf/32.1-tx2-jetpack-4.2-bsp-v125-image $(subst +,plus,$(REPO):$@))

cti-32.1-tx2-bsp-v125-elroy-revF+-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.1" TARGET_BOARD="elroy-revF+" $(CURDIR)/build.sh $(CURDIR)/cti/32.1/conf/32.1-tx2-jetpack-4.2-bsp-v125-image $(subst +,plus,$(REPO):$@))

cti-32.1-tx2-bsp-v125-orbitty-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.1" TARGET_BOARD="orbitty" $(CURDIR)/build.sh $(CURDIR)/cti/32.1/conf/32.1-tx2-jetpack-4.2-bsp-v125-image $(subst +,plus,$(REPO):$@))

cti-32.1-tx2-bsp-v125-rosie-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.1" TARGET_BOARD="rosie" $(CURDIR)/build.sh $(CURDIR)/cti/32.1/conf/32.1-tx2-jetpack-4.2-bsp-v125-image $(subst +,plus,$(REPO):$@))

cti-32.1-tx2-bsp-v125-rudi-mpcie-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.1" TARGET_BOARD="rudi-mpcie" $(CURDIR)/build.sh $(CURDIR)/cti/32.1/conf/32.1-tx2-jetpack-4.2-bsp-v125-image $(subst +,plus,$(REPO):$@))

cti-32.1-tx2-bsp-v125-rudi-usb3-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.1" TARGET_BOARD="rudi-usb3" $(CURDIR)/build.sh $(CURDIR)/cti/32.1/conf/32.1-tx2-jetpack-4.2-bsp-v125-image $(subst +,plus,$(REPO):$@))

cti-32.1-tx2-bsp-v125-rudi-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.1" TARGET_BOARD="rudi" $(CURDIR)/build.sh $(CURDIR)/cti/32.1/conf/32.1-tx2-jetpack-4.2-bsp-v125-image $(subst +,plus,$(REPO):$@))

cti-32.1-tx2-bsp-v125-sprocket-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.1" TARGET_BOARD="sprocket" $(CURDIR)/build.sh $(CURDIR)/cti/32.1/conf/32.1-tx2-jetpack-4.2-bsp-v125-image $(subst +,plus,$(REPO):$@))

cti-32.1-tx2-bsp-v125-spacely-base-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.1" TARGET_BOARD="spacely-base" $(CURDIR)/build.sh $(CURDIR)/cti/32.1/conf/32.1-tx2-jetpack-4.2-bsp-v125-image $(subst +,plus,$(REPO):$@))

cti-32.1-tx2-bsp-v125-spacely-imx185-6cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.1" TARGET_BOARD="spacely-imx185-6cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.1/conf/32.1-tx2-jetpack-4.2-bsp-v125-image $(subst +,plus,$(REPO):$@))

cti-32.1-tx2-bsp-v125-spacely-imx185-3cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.1" TARGET_BOARD="spacely-imx185-3cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.1/conf/32.1-tx2-jetpack-4.2-bsp-v125-image $(subst +,plus,$(REPO):$@))

cti-32.1-tx2-bsp-v125-spacely-imx274-6cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.1" TARGET_BOARD="spacely-imx274-6cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.1/conf/32.1-tx2-jetpack-4.2-bsp-v125-image $(subst +,plus,$(REPO):$@))

cti-32.1-tx2-bsp-v125-spacely-imx274-3cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.1" TARGET_BOARD="spacely-imx274-3cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.1/conf/32.1-tx2-jetpack-4.2-bsp-v125-image $(subst +,plus,$(REPO):$@))

cti-32.1-tx2-bsp-v125-cogswell-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.1" TARGET_BOARD="cogswell" $(CURDIR)/build.sh $(CURDIR)/cti/32.1/conf/32.1-tx2-jetpack-4.2-bsp-v125-image $(subst +,plus,$(REPO):$@))

cti-32.1-tx2-bsp-v125-vpg003-base-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.1" TARGET_BOARD="vpg003-base" $(CURDIR)/build.sh $(CURDIR)/cti/32.1/conf/32.1-tx2-jetpack-4.2-bsp-v125-image $(subst +,plus,$(REPO):$@))


# Device: L4T: 32.2.0 - BSP: V126-1

cti-32.2.0-tx2-bsp-v126-1-astro-mpcie-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/tx2/astro-mpcie" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-tx2-jetpack-4.2.1-bsp-v126-1-image $(subst +,plus,$(REPO):$@))

cti-32.2.0-tx2-bsp-v126-1-astro-revG+-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/tx2/astro-revG+" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-tx2-jetpack-4.2.1-bsp-v126-1-image $(subst +,plus,$(REPO):$@))

cti-32.2.0-tx2-bsp-v126-1-astro-usb3-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/tx2/astro-usb3" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-tx2-jetpack-4.2.1-bsp-v126-1-image $(subst +,plus,$(REPO):$@))

cti-32.2.0-tx2-bsp-v126-1-cogswell-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/tx2/cogswell" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-tx2-jetpack-4.2.1-bsp-v126-1-image $(subst +,plus,$(REPO):$@))

cti-32.2.0-tx2-bsp-v126-1-elroy-mpcie-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/tx2/elroy-mpcie" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-tx2-jetpack-4.2.1-bsp-v126-1-image $(subst +,plus,$(REPO):$@))

cti-32.2.0-tx2-bsp-v126-1-elroy-revF+-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/tx2/elroy-revF+" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-tx2-jetpack-4.2.1-bsp-v126-1-image $(subst +,plus,$(REPO):$@))

cti-32.2.0-tx2-bsp-v126-1-elroy-usb3-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/tx2/elroy-usb3" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-tx2-jetpack-4.2.1-bsp-v126-1-image $(subst +,plus,$(REPO):$@))

cti-32.2.0-tx2-bsp-v126-1-orbitty-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/tx2/orbitty" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-tx2-jetpack-4.2.1-bsp-v126-1-image $(subst +,plus,$(REPO):$@))

cti-32.2.0-tx2-bsp-v126-1-quasar-base-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/tx2/quasar-base" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-tx2-jetpack-4.2.1-bsp-v126-1-image $(subst +,plus,$(REPO):$@))

cti-32.2.0-tx2-bsp-v126-1-quasar-imx185-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/tx2/quasar-imx185" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-tx2-jetpack-4.2.1-bsp-v126-1-image $(subst +,plus,$(REPO):$@))

cti-32.2.0-tx2-bsp-v126-1-quasar-imx274-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/tx2/quasar-imx274" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-tx2-jetpack-4.2.1-bsp-v126-1-image $(subst +,plus,$(REPO):$@))

cti-32.2.0-tx2-bsp-v126-1-rosie-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/tx2/rosie" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-tx2-jetpack-4.2.1-bsp-v126-1-image $(subst +,plus,$(REPO):$@))

cti-32.2.0-tx2-bsp-v126-1-rudi-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/tx2/rudi" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-tx2-jetpack-4.2.1-bsp-v126-1-image $(subst +,plus,$(REPO):$@))

cti-32.2.0-tx2-bsp-v126-1-rudi-mpcie-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/tx2/rudi-mpcie" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-tx2-jetpack-4.2.1-bsp-v126-1-image $(subst +,plus,$(REPO):$@))

cti-32.2.0-tx2-bsp-v126-1-rudi-usb3-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/tx2/rudi-usb3" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-tx2-jetpack-4.2.1-bsp-v126-1-image $(subst +,plus,$(REPO):$@))

cti-32.2.0-tx2-bsp-v126-1-spacely-base-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/tx2/spacely-base" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-tx2-jetpack-4.2.1-bsp-v126-1-image $(subst +,plus,$(REPO):$@))

cti-32.2.0-tx2-bsp-v126-1-spacely-imx185-3cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/tx2/spacely-imx185-3cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-tx2-jetpack-4.2.1-bsp-v126-1-image $(subst +,plus,$(REPO):$@))

cti-32.2.0-tx2-bsp-v126-1-spacely-imx185-6cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/tx2/spacely-imx185-6cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-tx2-jetpack-4.2.1-bsp-v126-1-image $(subst +,plus,$(REPO):$@))

cti-32.2.0-tx2-bsp-v126-1-spacely-imx274-3cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/tx2/spacely-imx274-3cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-tx2-jetpack-4.2.1-bsp-v126-1-image $(subst +,plus,$(REPO):$@))

cti-32.2.0-tx2-bsp-v126-1-spacely-imx274-6cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/tx2/spacely-imx274-6cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-tx2-jetpack-4.2.1-bsp-v126-1-image $(subst +,plus,$(REPO):$@))

cti-32.2.0-tx2-bsp-v126-1-sprocket-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/tx2/sprocket" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-tx2-jetpack-4.2.1-bsp-v126-1-image $(subst +,plus,$(REPO):$@))

cti-32.2.0-tx2-bsp-v126-1-sprocket-imx185-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/tx2/sprocket-imx185" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-tx2-jetpack-4.2.1-bsp-v126-1-image $(subst +,plus,$(REPO):$@))

cti-32.2.0-tx2-bsp-v126-1-sprocket-imx274-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/tx2/sprocket-imx274" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-tx2-jetpack-4.2.1-bsp-v126-1-image $(subst +,plus,$(REPO):$@))

cti-32.2.0-tx2-bsp-v126-1-vpg003-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/tx2/vpg003" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-tx2-jetpack-4.2.1-bsp-v126-1-image $(subst +,plus,$(REPO):$@))

cti-32.2.0-tx2-bsp-v126-1-vpg003-imx185-3cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/tx2/vpg003-imx185-3cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-tx2-jetpack-4.2.1-bsp-v126-1-image $(subst +,plus,$(REPO):$@))

cti-32.2.0-tx2-bsp-v126-1-vpg003-imx274-3cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/tx2/vpg003-imx274-3cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-tx2-jetpack-4.2.1-bsp-v126-1-image $(subst +,plus,$(REPO):$@))


# Device: L4T: 32.2.1 - BSP: TX2-32.2.1-V004

cti-32.2.1-tx2-bsp-tx2-32.2.1-v004-astro-mpcie-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2/astro-mpcie" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2-bsp-tx2-32.2.1-v004-astro-revG+-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2/astro-revG+" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2-bsp-tx2-32.2.1-v004-astro-usb3-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2/astro-usb3" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2-bsp-tx2-32.2.1-v004-cogswell-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2/cogswell" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2-bsp-tx2-32.2.1-v004-elroy-mpcie-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2/elroy-mpcie" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2-bsp-tx2-32.2.1-v004-elroy-revF+-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2/elroy-revF+" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2-bsp-tx2-32.2.1-v004-elroy-usb3-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2/elroy-usb3" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2-bsp-tx2-32.2.1-v004-orbitty-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2/orbitty" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2-bsp-tx2-32.2.1-v004-quasar-base-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2/quasar-base" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2-bsp-tx2-32.2.1-v004-quasar-imx185-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2/quasar-imx185" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2-bsp-tx2-32.2.1-v004-quasar-imx274-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2/quasar-imx274" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2-bsp-tx2-32.2.1-v004-rosie-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2/rosie" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2-bsp-tx2-32.2.1-v004-rudi-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2/rudi" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2-bsp-tx2-32.2.1-v004-rudi-mpcie-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2/rudi-mpcie" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2-bsp-tx2-32.2.1-v004-rudi-usb3-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2/rudi-usb3" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2-bsp-tx2-32.2.1-v004-spacely-base-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2/spacely-base" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2-bsp-tx2-32.2.1-v004-spacely-imx185-3cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2/spacely-imx185-3cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2-bsp-tx2-32.2.1-v004-spacely-imx185-6cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2/spacely-imx185-6cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2-bsp-tx2-32.2.1-v004-spacely-imx274-3cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2/spacely-imx274-3cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2-bsp-tx2-32.2.1-v004-spacely-imx274-6cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2/spacely-imx274-6cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2-bsp-tx2-32.2.1-v004-sprocket-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2/sprocket" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2-bsp-tx2-32.2.1-v004-sprocket-imx185-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2/sprocket-imx185" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2-bsp-tx2-32.2.1-v004-sprocket-imx274-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2/sprocket-imx274" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2-bsp-tx2-32.2.1-v004-vpg003-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2/vpg003" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2-bsp-tx2-32.2.1-v004-vpg003-imx185-3cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2/vpg003-imx185-3cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2-bsp-tx2-32.2.1-v004-vpg003-imx274-3cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2/vpg003-imx274-3cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))


# Device: L4T: 32.3.1 - BSP: TX2-32.3.1-V003

cti-32.3.1-tx2-bsp-tx2-32.3.1-v003-astro-mpcie-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2/astro-mpcie" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2-bsp-tx2-32.3.1-v003-astro-revG+-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2/astro-revG+" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2-bsp-tx2-32.3.1-v003-astro-usb3-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2/astro-usb3" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2-bsp-tx2-32.3.1-v003-cogswell-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2/cogswell" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2-bsp-tx2-32.3.1-v003-elroy-mpcie-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2/elroy-mpcie" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2-bsp-tx2-32.3.1-v003-elroy-revF+-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2/elroy-revF+" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2-bsp-tx2-32.3.1-v003-elroy-usb3-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2/elroy-usb3" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2-bsp-tx2-32.3.1-v003-orbitty-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2/orbitty" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2-bsp-tx2-32.3.1-v003-quasar-imx185-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2/quasar-imx185" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2-bsp-tx2-32.3.1-v003-quasar-imx274-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2/quasar-imx274" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2-bsp-tx2-32.3.1-v003-quasar-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2/quasar" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2-bsp-tx2-32.3.1-v003-rosie-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2/rosie" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2-bsp-tx2-32.3.1-v003-rudi-mpcie-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2/rudi-mpcie" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2-bsp-tx2-32.3.1-v003-rudi-usb3-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2/rudi-usb3" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2-bsp-tx2-32.3.1-v003-rudi-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2/rudi" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2-bsp-tx2-32.3.1-v003-spacely-imx185-3cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2/spacely-imx185-3cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2-bsp-tx2-32.3.1-v003-spacely-imx185-6cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2/spacely-imx185-6cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2-bsp-tx2-32.3.1-v003-spacely-imx274-3cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2/spacely-imx274-3cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2-bsp-tx2-32.3.1-v003-spacely-imx274-6cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2/spacely-imx274-6cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2-bsp-tx2-32.3.1-v003-spacely-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2/spacely" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2-bsp-tx2-32.3.1-v003-sprocket-imx185-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2/sprocket-imx185" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2-bsp-tx2-32.3.1-v003-sprocket-imx274-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2/sprocket-imx274" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2-bsp-tx2-32.3.1-v003-sprocket-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2/sprocket" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2-bsp-tx2-32.3.1-v003-vpg003-imx185-3cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2/vpg003-imx185-3cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2-bsp-tx2-32.3.1-v003-vpg003-imx274-3cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2/vpg003-imx274-3cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2-bsp-tx2-32.3.1-v003-vpg003-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2/vpg003" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))


# Device: L4T: 32.4.3 - BSP: TX2-32.4.3-V002

cti-32.4.3-tx2-bsp-tx2-32.4.3-v002-astro-mpcie-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2/astro-mpcie" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2-bsp-tx2-32.4.3-v002-astro-revG+-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2/astro-revG+" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2-bsp-tx2-32.4.3-v002-astro-usb3-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2/astro-usb3" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2-bsp-tx2-32.4.3-v002-cogswell-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2/cogswell" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2-bsp-tx2-32.4.3-v002-elroy-mpcie-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2/elroy-mpcie" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2-bsp-tx2-32.4.3-v002-elroy-revF+-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2/elroy-revF+" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2-bsp-tx2-32.4.3-v002-elroy-usb3-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2/elroy-usb3" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2-bsp-tx2-32.4.3-v002-orbitty-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2/orbitty" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2-bsp-tx2-32.4.3-v002-quasar-imx185-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2/quasar-imx185" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2-bsp-tx2-32.4.3-v002-quasar-imx274-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2/quasar-imx274" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2-bsp-tx2-32.4.3-v002-quasar-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2/quasar" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2-bsp-tx2-32.4.3-v002-rosie-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2/rosie" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2-bsp-tx2-32.4.3-v002-rudi-mpcie-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2/rudi-mpcie" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2-bsp-tx2-32.4.3-v002-rudi-usb3-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2/rudi-usb3" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2-bsp-tx2-32.4.3-v002-rudi-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2/rudi" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2-bsp-tx2-32.4.3-v002-spacely-imx185-3cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2/spacely-imx185-3cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2-bsp-tx2-32.4.3-v002-spacely-imx185-6cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2/spacely-imx185-6cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2-bsp-tx2-32.4.3-v002-spacely-imx274-3cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2/spacely-imx274-3cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2-bsp-tx2-32.4.3-v002-spacely-imx274-6cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2/spacely-imx274-6cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2-bsp-tx2-32.4.3-v002-spacely-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2/spacely" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2-bsp-tx2-32.4.3-v002-sprocket-imx185-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2/sprocket-imx185" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2-bsp-tx2-32.4.3-v002-sprocket-imx274-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2/sprocket-imx274" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2-bsp-tx2-32.4.3-v002-sprocket-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2/sprocket" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2-bsp-tx2-32.4.3-v002-vpg003-imx274-2cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2/vpg003-imx274-2cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2-bsp-tx2-32.4.3-v002-vpg003-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2/vpg003" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))



#
# tx2-4gb - Device Level
#


# Device: L4T: 32.2.1 - BSP: TX2-32.2.1-V004

cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-astro-mpcie-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2-4G/astro-mpcie" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2-4gb-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-astro-revG+-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2-4G/astro-revG+" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2-4gb-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-astro-usb3-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2-4G/astro-usb3" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2-4gb-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-cogswell-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2-4G/cogswell" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2-4gb-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-elroy-mpcie-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2-4G/elroy-mpcie" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2-4gb-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-elroy-revF+-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2-4G/elroy-revF+" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2-4gb-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-elroy-usb3-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2-4G/elroy-usb3" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2-4gb-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-orbitty-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2-4G/orbitty" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2-4gb-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-quasar-base-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2-4G/quasar-base" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2-4gb-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-quasar-imx185-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2-4G/quasar-imx185" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2-4gb-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-quasar-imx274-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2-4G/quasar-imx274" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2-4gb-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-rosie-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2-4G/rosie" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2-4gb-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-rudi-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2-4G/rudi" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2-4gb-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-rudi-mpcie-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2-4G/rudi-mpcie" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2-4gb-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-rudi-usb3-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2-4G/rudi-usb3" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2-4gb-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-spacely-base-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2-4G/spacely-base" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2-4gb-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-spacely-imx185-3cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2-4G/spacely-imx185-3cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2-4gb-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-spacely-imx185-6cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2-4G/spacely-imx185-6cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2-4gb-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-spacely-imx274-3cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2-4G/spacely-imx274-3cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2-4gb-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-spacely-imx274-6cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2-4G/spacely-imx274-6cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2-4gb-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-sprocket-base-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2-4G/sprocket-base" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2-4gb-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-sprocket-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2-4G/sprocket" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2-4gb-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-sprocket-imx185-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2-4G/sprocket-imx185" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2-4gb-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-sprocket-imx274-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2-4G/sprocket-imx274" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2-4gb-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-vpg003-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2-4G/vpg003" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2-4gb-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-vpg003-imx185-3cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2-4G/vpg003-imx185-3cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2-4gb-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-vpg003-imx274-3cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2-4G/vpg003-imx274-3cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2-4gb-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))


# Device: L4T: 32.3.1 - BSP: TX2-32.3.1-V003

cti-32.3.1-tx2-4gb-bsp-tx2-32.3.1-v003-astro-mpcie-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2-4G/astro-mpcie" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2-4gb-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2-4gb-bsp-tx2-32.3.1-v003-astro-revG+-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2-4G/astro-revG+" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2-4gb-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2-4gb-bsp-tx2-32.3.1-v003-astro-usb3-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2-4G/astro-usb3" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2-4gb-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2-4gb-bsp-tx2-32.3.1-v003-cogswell-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2-4G/cogswell" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2-4gb-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2-4gb-bsp-tx2-32.3.1-v003-elroy-mpcie-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2-4G/elroy-mpcie" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2-4gb-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2-4gb-bsp-tx2-32.3.1-v003-elroy-revF+-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2-4G/elroy-revF+" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2-4gb-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2-4gb-bsp-tx2-32.3.1-v003-elroy-usb3-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2-4G/elroy-usb3" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2-4gb-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2-4gb-bsp-tx2-32.3.1-v003-orbitty-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2-4G/orbitty" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2-4gb-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2-4gb-bsp-tx2-32.3.1-v003-quasar-imx185-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2-4G/quasar-imx185" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2-4gb-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2-4gb-bsp-tx2-32.3.1-v003-quasar-imx274-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2-4G/quasar-imx274" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2-4gb-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2-4gb-bsp-tx2-32.3.1-v003-quasar-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2-4G/quasar" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2-4gb-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2-4gb-bsp-tx2-32.3.1-v003-rosie-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2-4G/rosie" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2-4gb-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2-4gb-bsp-tx2-32.3.1-v003-rudi-mpcie-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2-4G/rudi-mpcie" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2-4gb-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2-4gb-bsp-tx2-32.3.1-v003-rudi-usb3-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2-4G/rudi-usb3" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2-4gb-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2-4gb-bsp-tx2-32.3.1-v003-rudi-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2-4G/rudi" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2-4gb-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2-4gb-bsp-tx2-32.3.1-v003-spacely-imx185-3cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2-4G/spacely-imx185-3cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2-4gb-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2-4gb-bsp-tx2-32.3.1-v003-spacely-imx185-6cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2-4G/spacely-imx185-6cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2-4gb-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2-4gb-bsp-tx2-32.3.1-v003-spacely-imx274-3cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2-4G/spacely-imx274-3cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2-4gb-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2-4gb-bsp-tx2-32.3.1-v003-spacely-imx274-6cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2-4G/spacely-imx274-6cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2-4gb-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2-4gb-bsp-tx2-32.3.1-v003-spacely-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2-4G/spacely" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2-4gb-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2-4gb-bsp-tx2-32.3.1-v003-sprocket-imx185-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2-4G/sprocket-imx185" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2-4gb-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2-4gb-bsp-tx2-32.3.1-v003-sprocket-imx274-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2-4G/sprocket-imx274" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2-4gb-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2-4gb-bsp-tx2-32.3.1-v003-sprocket-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2-4G/sprocket" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2-4gb-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2-4gb-bsp-tx2-32.3.1-v003-vpg003-imx185-3cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2-4G/vpg003-imx185-3cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2-4gb-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2-4gb-bsp-tx2-32.3.1-v003-vpg003-imx274-3cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2-4G/vpg003-imx274-3cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2-4gb-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2-4gb-bsp-tx2-32.3.1-v003-vpg003-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2-4G/vpg003" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2-4gb-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))


# Device: L4T: 32.4.3 - BSP: TX2-32.4.3-V002

cti-32.4.3-tx2-4gb-bsp-tx2-32.4.3-v002-astro-mpcie-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2-4G/astro-mpcie" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2-4gb-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2-4gb-bsp-tx2-32.4.3-v002-astro-revG+-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2-4G/astro-revG+" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2-4gb-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2-4gb-bsp-tx2-32.4.3-v002-astro-usb3-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2-4G/astro-usb3" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2-4gb-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2-4gb-bsp-tx2-32.4.3-v002-cogswell-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2-4G/cogswell" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2-4gb-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2-4gb-bsp-tx2-32.4.3-v002-elroy-mpcie-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2-4G/elroy-mpcie" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2-4gb-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2-4gb-bsp-tx2-32.4.3-v002-elroy-revF+-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2-4G/elroy-revF+" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2-4gb-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2-4gb-bsp-tx2-32.4.3-v002-elroy-usb3-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2-4G/elroy-usb3" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2-4gb-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2-4gb-bsp-tx2-32.4.3-v002-orbitty-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2-4G/orbitty" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2-4gb-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2-4gb-bsp-tx2-32.4.3-v002-quasar-imx185-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2-4G/quasar-imx185" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2-4gb-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2-4gb-bsp-tx2-32.4.3-v002-quasar-imx274-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2-4G/quasar-imx274" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2-4gb-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2-4gb-bsp-tx2-32.4.3-v002-quasar-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2-4G/quasar" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2-4gb-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2-4gb-bsp-tx2-32.4.3-v002-rosie-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2-4G/rosie" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2-4gb-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2-4gb-bsp-tx2-32.4.3-v002-rudi-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2-4G/rudi" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2-4gb-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2-4gb-bsp-tx2-32.4.3-v002-spacely-imx185-3cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2-4G/spacely-imx185-3cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2-4gb-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2-4gb-bsp-tx2-32.4.3-v002-spacely-imx185-6cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2-4G/spacely-imx185-6cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2-4gb-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2-4gb-bsp-tx2-32.4.3-v002-spacely-imx274-3cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2-4G/spacely-imx274-3cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2-4gb-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2-4gb-bsp-tx2-32.4.3-v002-spacely-imx274-6cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2-4G/spacely-imx274-6cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2-4gb-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2-4gb-bsp-tx2-32.4.3-v002-spacely-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2-4G/spacely" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2-4gb-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2-4gb-bsp-tx2-32.4.3-v002-sprocket-imx185-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2-4G/sprocket-imx185" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2-4gb-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2-4gb-bsp-tx2-32.4.3-v002-sprocket-imx274-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2-4G/sprocket-imx274" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2-4gb-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2-4gb-bsp-tx2-32.4.3-v002-sprocket-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2-4G/sprocket" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2-4gb-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2-4gb-bsp-tx2-32.4.3-v002-vpg003-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2-4G/vpg003" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2-4gb-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))



#
# tx2i - Device Level
#


# Device: L4T: 32.1 - BSP: V125

cti-32.1-tx2i-bsp-v125-astro-mpcie-tx2i-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.1" TARGET_BOARD="astro-mpcie-tx2i" $(CURDIR)/build.sh $(CURDIR)/cti/32.1/conf/32.1-tx2i-jetpack-4.2-bsp-v125-image $(subst +,plus,$(REPO):$@))

cti-32.1-tx2i-bsp-v125-astro-usb3-tx2i-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.1" TARGET_BOARD="astro-usb3-tx2i" $(CURDIR)/build.sh $(CURDIR)/cti/32.1/conf/32.1-tx2i-jetpack-4.2-bsp-v125-image $(subst +,plus,$(REPO):$@))

cti-32.1-tx2i-bsp-v125-astro-revG+-tx2i-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.1" TARGET_BOARD="astro-revG+-tx2i" $(CURDIR)/build.sh $(CURDIR)/cti/32.1/conf/32.1-tx2i-jetpack-4.2-bsp-v125-image $(subst +,plus,$(REPO):$@))

cti-32.1-tx2i-bsp-v125-elroy-mpcie-tx2i-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.1" TARGET_BOARD="elroy-mpcie-tx2i" $(CURDIR)/build.sh $(CURDIR)/cti/32.1/conf/32.1-tx2i-jetpack-4.2-bsp-v125-image $(subst +,plus,$(REPO):$@))

cti-32.1-tx2i-bsp-v125-elroy-usb3-tx2i-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.1" TARGET_BOARD="elroy-usb3-tx2i" $(CURDIR)/build.sh $(CURDIR)/cti/32.1/conf/32.1-tx2i-jetpack-4.2-bsp-v125-image $(subst +,plus,$(REPO):$@))

cti-32.1-tx2i-bsp-v125-elroy-refF+-tx2i-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.1" TARGET_BOARD="elroy-refF+-tx2i" $(CURDIR)/build.sh $(CURDIR)/cti/32.1/conf/32.1-tx2i-jetpack-4.2-bsp-v125-image $(subst +,plus,$(REPO):$@))

cti-32.1-tx2i-bsp-v125-orbitty-tx2i-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.1" TARGET_BOARD="orbitty-tx2i" $(CURDIR)/build.sh $(CURDIR)/cti/32.1/conf/32.1-tx2i-jetpack-4.2-bsp-v125-image $(subst +,plus,$(REPO):$@))

cti-32.1-tx2i-bsp-v125-rosie-tx2i-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.1" TARGET_BOARD="rosie-tx2i" $(CURDIR)/build.sh $(CURDIR)/cti/32.1/conf/32.1-tx2i-jetpack-4.2-bsp-v125-image $(subst +,plus,$(REPO):$@))

cti-32.1-tx2i-bsp-v125-rudi-mpcie-tx2i-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.1" TARGET_BOARD="rudi-mpcie-tx2i" $(CURDIR)/build.sh $(CURDIR)/cti/32.1/conf/32.1-tx2i-jetpack-4.2-bsp-v125-image $(subst +,plus,$(REPO):$@))

cti-32.1-tx2i-bsp-v125-rudi-usb3-tx2i-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.1" TARGET_BOARD="rudi-usb3-tx2i" $(CURDIR)/build.sh $(CURDIR)/cti/32.1/conf/32.1-tx2i-jetpack-4.2-bsp-v125-image $(subst +,plus,$(REPO):$@))

cti-32.1-tx2i-bsp-v125-rudi-tx2i-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.1" TARGET_BOARD="rudi-tx2i" $(CURDIR)/build.sh $(CURDIR)/cti/32.1/conf/32.1-tx2i-jetpack-4.2-bsp-v125-image $(subst +,plus,$(REPO):$@))

cti-32.1-tx2i-bsp-v125-spacely-base-tx2i-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.1" TARGET_BOARD="spacely-base-tx2i" $(CURDIR)/build.sh $(CURDIR)/cti/32.1/conf/32.1-tx2i-jetpack-4.2-bsp-v125-image $(subst +,plus,$(REPO):$@))

cti-32.1-tx2i-bsp-v125-spacely-imx185-6cam-tx2i-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.1" TARGET_BOARD="spacely-imx185-6cam-tx2i" $(CURDIR)/build.sh $(CURDIR)/cti/32.1/conf/32.1-tx2i-jetpack-4.2-bsp-v125-image $(subst +,plus,$(REPO):$@))

cti-32.1-tx2i-bsp-v125-spacely-imx185-3cam-tx2i-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.1" TARGET_BOARD="spacely-imx185-3cam-tx2i" $(CURDIR)/build.sh $(CURDIR)/cti/32.1/conf/32.1-tx2i-jetpack-4.2-bsp-v125-image $(subst +,plus,$(REPO):$@))

cti-32.1-tx2i-bsp-v125-spacely-imx274-6cam-tx2i-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.1" TARGET_BOARD="spacely-imx274-6cam-tx2i" $(CURDIR)/build.sh $(CURDIR)/cti/32.1/conf/32.1-tx2i-jetpack-4.2-bsp-v125-image $(subst +,plus,$(REPO):$@))

cti-32.1-tx2i-bsp-v125-spacely-imx274-3cam-tx2i-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.1" TARGET_BOARD="spacely-imx274-3cam-tx2i" $(CURDIR)/build.sh $(CURDIR)/cti/32.1/conf/32.1-tx2i-jetpack-4.2-bsp-v125-image $(subst +,plus,$(REPO):$@))

cti-32.1-tx2i-bsp-v125-cogswell-tx2i-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.1" TARGET_BOARD="cogswell-tx2i" $(CURDIR)/build.sh $(CURDIR)/cti/32.1/conf/32.1-tx2i-jetpack-4.2-bsp-v125-image $(subst +,plus,$(REPO):$@))

cti-32.1-tx2i-bsp-v125-vpg003-base-tx2i-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.1" TARGET_BOARD="vpg003-base-tx2i" $(CURDIR)/build.sh $(CURDIR)/cti/32.1/conf/32.1-tx2i-jetpack-4.2-bsp-v125-image $(subst +,plus,$(REPO):$@))


# Device: L4T: 32.2.0 - BSP: V126-1

cti-32.2.0-tx2i-bsp-v126-1-astro-mpcie-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/tx2i/astro-mpcie" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-tx2i-jetpack-4.2.1-bsp-v126-1-image $(subst +,plus,$(REPO):$@))

cti-32.2.0-tx2i-bsp-v126-1-astro-revG+-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/tx2i/astro-revG+" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-tx2i-jetpack-4.2.1-bsp-v126-1-image $(subst +,plus,$(REPO):$@))

cti-32.2.0-tx2i-bsp-v126-1-astro-usb3-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/tx2i/astro-usb3" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-tx2i-jetpack-4.2.1-bsp-v126-1-image $(subst +,plus,$(REPO):$@))

cti-32.2.0-tx2i-bsp-v126-1-astro-usb-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/tx2i/astro-usb" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-tx2i-jetpack-4.2.1-bsp-v126-1-image $(subst +,plus,$(REPO):$@))

cti-32.2.0-tx2i-bsp-v126-1-cogswell-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/tx2i/cogswell" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-tx2i-jetpack-4.2.1-bsp-v126-1-image $(subst +,plus,$(REPO):$@))

cti-32.2.0-tx2i-bsp-v126-1-elroy-mpcie-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/tx2i/elroy-mpcie" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-tx2i-jetpack-4.2.1-bsp-v126-1-image $(subst +,plus,$(REPO):$@))

cti-32.2.0-tx2i-bsp-v126-1-elroy-revF+-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/tx2i/elroy-revF+" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-tx2i-jetpack-4.2.1-bsp-v126-1-image $(subst +,plus,$(REPO):$@))

cti-32.2.0-tx2i-bsp-v126-1-elroy-usb3-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/tx2i/elroy-usb3" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-tx2i-jetpack-4.2.1-bsp-v126-1-image $(subst +,plus,$(REPO):$@))

cti-32.2.0-tx2i-bsp-v126-1-orbitty-base-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/tx2i/orbitty-base" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-tx2i-jetpack-4.2.1-bsp-v126-1-image $(subst +,plus,$(REPO):$@))

cti-32.2.0-tx2i-bsp-v126-1-orbitty-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/tx2i/orbitty" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-tx2i-jetpack-4.2.1-bsp-v126-1-image $(subst +,plus,$(REPO):$@))

cti-32.2.0-tx2i-bsp-v126-1-quasar-base-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/tx2i/quasar-base" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-tx2i-jetpack-4.2.1-bsp-v126-1-image $(subst +,plus,$(REPO):$@))

cti-32.2.0-tx2i-bsp-v126-1-quasar-imx185-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/tx2i/quasar-imx185" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-tx2i-jetpack-4.2.1-bsp-v126-1-image $(subst +,plus,$(REPO):$@))

cti-32.2.0-tx2i-bsp-v126-1-quasar-imx274-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/tx2i/quasar-imx274" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-tx2i-jetpack-4.2.1-bsp-v126-1-image $(subst +,plus,$(REPO):$@))

cti-32.2.0-tx2i-bsp-v126-1-rosie-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/tx2i/rosie" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-tx2i-jetpack-4.2.1-bsp-v126-1-image $(subst +,plus,$(REPO):$@))

cti-32.2.0-tx2i-bsp-v126-1-rudi-base-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/tx2i/rudi-base" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-tx2i-jetpack-4.2.1-bsp-v126-1-image $(subst +,plus,$(REPO):$@))

cti-32.2.0-tx2i-bsp-v126-1-rudi-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/tx2i/rudi" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-tx2i-jetpack-4.2.1-bsp-v126-1-image $(subst +,plus,$(REPO):$@))

cti-32.2.0-tx2i-bsp-v126-1-rudi-mpcie-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/tx2i/rudi-mpcie" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-tx2i-jetpack-4.2.1-bsp-v126-1-image $(subst +,plus,$(REPO):$@))

cti-32.2.0-tx2i-bsp-v126-1-rudi-usb3-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/tx2i/rudi-usb3" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-tx2i-jetpack-4.2.1-bsp-v126-1-image $(subst +,plus,$(REPO):$@))

cti-32.2.0-tx2i-bsp-v126-1-spacely-base-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/tx2i/spacely-base" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-tx2i-jetpack-4.2.1-bsp-v126-1-image $(subst +,plus,$(REPO):$@))

cti-32.2.0-tx2i-bsp-v126-1-spacely-imx185-3cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/tx2i/spacely-imx185-3cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-tx2i-jetpack-4.2.1-bsp-v126-1-image $(subst +,plus,$(REPO):$@))

cti-32.2.0-tx2i-bsp-v126-1-spacely-imx185-6cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/tx2i/spacely-imx185-6cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-tx2i-jetpack-4.2.1-bsp-v126-1-image $(subst +,plus,$(REPO):$@))

cti-32.2.0-tx2i-bsp-v126-1-spacely-imx274-3cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/tx2i/spacely-imx274-3cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-tx2i-jetpack-4.2.1-bsp-v126-1-image $(subst +,plus,$(REPO):$@))

cti-32.2.0-tx2i-bsp-v126-1-spacely-imx274-6cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/tx2i/spacely-imx274-6cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-tx2i-jetpack-4.2.1-bsp-v126-1-image $(subst +,plus,$(REPO):$@))

cti-32.2.0-tx2i-bsp-v126-1-sprocket-base-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/tx2i/sprocket-base" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-tx2i-jetpack-4.2.1-bsp-v126-1-image $(subst +,plus,$(REPO):$@))

cti-32.2.0-tx2i-bsp-v126-1-sprocket-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/tx2i/sprocket" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-tx2i-jetpack-4.2.1-bsp-v126-1-image $(subst +,plus,$(REPO):$@))

cti-32.2.0-tx2i-bsp-v126-1-sprocket-imx185-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/tx2i/sprocket-imx185" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-tx2i-jetpack-4.2.1-bsp-v126-1-image $(subst +,plus,$(REPO):$@))

cti-32.2.0-tx2i-bsp-v126-1-sprocket-imx274-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/tx2i/sprocket-imx274" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-tx2i-jetpack-4.2.1-bsp-v126-1-image $(subst +,plus,$(REPO):$@))

cti-32.2.0-tx2i-bsp-v126-1-vpg003-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/tx2i/vpg003" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-tx2i-jetpack-4.2.1-bsp-v126-1-image $(subst +,plus,$(REPO):$@))

cti-32.2.0-tx2i-bsp-v126-1-vpg003-imx185-3cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/tx2i/vpg003-imx185-3cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-tx2i-jetpack-4.2.1-bsp-v126-1-image $(subst +,plus,$(REPO):$@))

cti-32.2.0-tx2i-bsp-v126-1-vpg003-imx274-3cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.0" TARGET_BOARD="cti/tx2i/vpg003-imx274-3cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.0/conf/32.2.0-tx2i-jetpack-4.2.1-bsp-v126-1-image $(subst +,plus,$(REPO):$@))


# Device: L4T: 32.2.1 - BSP: TX2-32.2.1-V004

cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-astro-mpcie-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2i/astro-mpcie" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2i-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-astro-revG+-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2i/astro-revG+" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2i-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-astro-usb3-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2i/astro-usb3" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2i-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-astro-usb-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2i/astro-usb" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2i-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-cogswell-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2i/cogswell" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2i-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-elroy-mpcie-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2i/elroy-mpcie" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2i-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-elroy-revF+-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2i/elroy-revF+" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2i-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-elroy-usb3-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2i/elroy-usb3" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2i-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-orbitty-base-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2i/orbitty-base" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2i-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-orbitty-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2i/orbitty" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2i-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-quasar-base-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2i/quasar-base" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2i-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-quasar-imx185-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2i/quasar-imx185" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2i-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-quasar-imx274-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2i/quasar-imx274" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2i-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-rosie-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2i/rosie" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2i-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-rudi-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2i/rudi" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2i-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-rudi-mpcie-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2i/rudi-mpcie" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2i-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-rudi-usb3-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2i/rudi-usb3" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2i-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-spacely-base-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2i/spacely-base" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2i-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-spacely-imx185-3cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2i/spacely-imx185-3cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2i-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-spacely-imx185-6cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2i/spacely-imx185-6cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2i-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-spacely-imx274-3cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2i/spacely-imx274-3cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2i-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-spacely-imx274-6cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2i/spacely-imx274-6cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2i-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-sprocket-base-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2i/sprocket-base" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2i-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-sprocket-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2i/sprocket" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2i-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-sprocket-imx185-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2i/sprocket-imx185" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2i-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-sprocket-imx274-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2i/sprocket-imx274" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2i-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-vpg003-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2i/vpg003" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2i-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-vpg003-imx185-3cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2i/vpg003-imx185-3cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2i-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))

cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-vpg003-imx274-3cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.2.1" TARGET_BOARD="cti/tx2i/vpg003-imx274-3cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.2.1/conf/32.2.1-tx2i-jetpack-4.2.2-bsp-tx2-32.2.1-v004-image $(subst +,plus,$(REPO):$@))


# Device: L4T: 32.3.1 - BSP: TX2-32.3.1-V003

cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-astro-mpcie-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2i/astro-mpcie" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2i-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-astro-revG+-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2i/astro-revG+" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2i-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-astro-usb-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2i/astro-usb" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2i-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-astro-usb3-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2i/astro-usb3" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2i-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-cogswell-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2i/cogswell" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2i-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-elroy-mpcie-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2i/elroy-mpcie" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2i-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-elroy-revF+-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2i/elroy-revF+" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2i-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-elroy-usb3-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2i/elroy-usb3" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2i-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-orbitty-base-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2i/orbitty-base" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2i-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-orbitty-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2i/orbitty" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2i-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-quasar-imx185-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2i/quasar-imx185" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2i-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-quasar-imx274-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2i/quasar-imx274" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2i-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-quasar-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2i/quasar" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2i-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-rosie-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2i/rosie" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2i-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-rudi-mpcie-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2i/rudi-mpcie" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2i-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-rudi-usb3-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2i/rudi-usb3" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2i-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-rudi-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2i/rudi" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2i-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-spacely-imx185-3cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2i/spacely-imx185-3cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2i-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-spacely-imx185-6cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2i/spacely-imx185-6cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2i-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-spacely-imx274-3cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2i/spacely-imx274-3cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2i-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-spacely-imx274-6cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2i/spacely-imx274-6cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2i-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-spacely-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2i/spacely" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2i-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-sprocket-imx185-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2i/sprocket-imx185" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2i-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-sprocket-imx274-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2i/sprocket-imx274" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2i-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-sprocket-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2i/sprocket" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2i-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-vpg003-imx185-3cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2i/vpg003-imx185-3cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2i-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-vpg003-imx274-3cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2i/vpg003-imx274-3cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2i-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))

cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-vpg003-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.3.1" TARGET_BOARD="cti/tx2i/vpg003" $(CURDIR)/build.sh $(CURDIR)/cti/32.3.1/conf/32.3.1-tx2i-jetpack-4.3-bsp-tx2-32.3.1-v003-image $(subst +,plus,$(REPO):$@))


# Device: L4T: 32.4.3 - BSP: TX2-32.4.3-V002

cti-32.4.3-tx2i-bsp-tx2-32.4.3-v002-astro-mpcie-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2i/astro-mpcie" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2i-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2i-bsp-tx2-32.4.3-v002-astro-revG+-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2i/astro-revG+" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2i-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2i-bsp-tx2-32.4.3-v002-astro-usb3-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2i/astro-usb3" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2i-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2i-bsp-tx2-32.4.3-v002-cogswell-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2i/cogswell" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2i-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2i-bsp-tx2-32.4.3-v002-elroy-mpcie-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2i/elroy-mpcie" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2i-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2i-bsp-tx2-32.4.3-v002-elroy-revF+-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2i/elroy-revF+" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2i-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2i-bsp-tx2-32.4.3-v002-elroy-usb3-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2i/elroy-usb3" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2i-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2i-bsp-tx2-32.4.3-v002-orbitty-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2i/orbitty" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2i-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2i-bsp-tx2-32.4.3-v002-quasar-imx185-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2i/quasar-imx185" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2i-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2i-bsp-tx2-32.4.3-v002-quasar-imx274-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2i/quasar-imx274" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2i-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2i-bsp-tx2-32.4.3-v002-quasar-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2i/quasar" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2i-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2i-bsp-tx2-32.4.3-v002-rosie-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2i/rosie" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2i-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2i-bsp-tx2-32.4.3-v002-rudi-mpcie-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2i/rudi-mpcie" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2i-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2i-bsp-tx2-32.4.3-v002-rudi-usb3-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2i/rudi-usb3" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2i-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2i-bsp-tx2-32.4.3-v002-rudi-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2i/rudi" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2i-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2i-bsp-tx2-32.4.3-v002-spacely-imx185-3cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2i/spacely-imx185-3cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2i-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2i-bsp-tx2-32.4.3-v002-spacely-imx185-6cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2i/spacely-imx185-6cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2i-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2i-bsp-tx2-32.4.3-v002-spacely-imx274-3cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2i/spacely-imx274-3cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2i-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2i-bsp-tx2-32.4.3-v002-spacely-imx274-6cam-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2i/spacely-imx274-6cam" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2i-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2i-bsp-tx2-32.4.3-v002-spacely-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2i/spacely" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2i-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2i-bsp-tx2-32.4.3-v002-sprocket-imx185-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2i/sprocket-imx185" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2i-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2i-bsp-tx2-32.4.3-v002-sprocket-imx274-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2i/sprocket-imx274" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2i-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2i-bsp-tx2-32.4.3-v002-sprocket-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2i/sprocket" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2i-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))

cti-32.4.3-tx2i-bsp-tx2-32.4.3-v002-vpg003-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.4.3" TARGET_BOARD="cti/tx2i/vpg003" $(CURDIR)/build.sh $(CURDIR)/cti/32.4.3/conf/32.4.3-tx2i-jetpack-4.4-bsp-tx2-32.4.3-v002-image $(subst +,plus,$(REPO):$@))


