# Miscreated user.cfg

Most of these settings come from https://steamcommunity.com/sharedfiles/filedetails/?id=416735848. Here are my settings and why I have them set to such:

## General settings
Horizontal resolution
`r_Width=1920`

Vertical resolution
`r_Height=1080`

Sets the resolution and memory pool available to textures. An increase in texture resolution provides sharper, more realistic looking textures. Can make a big difference on performance if you're GPU memory bound.
`r_TexturesStreamPoolSize=640`

I have two Nvidia GTX 770 GPUs running in SLI, so setting MultiGPU to 1 is how I need to be running. Other settings are: 0=disabled, 1=extra overhead to allow SLI (NVidia) or Crossfire (AMD), 2(default)=automatic detection (currently SLI only, means off for AMD) should be activated before rendering.
`r_MultiGPU=1`

Fullscreen mode. 0=Window/1=Fullscreen
`r_Fullscreen=0`

## Performance settings
Turn off shadows on particles.
`e_ParticlesShadows = 0`

Enables or disables Tessellation. Enabled by default, set to 0 to turn it off. This can be a real performance saver. Been known to cause issues with AMD CPUs, try disabling if you have an AMD processor.
`e_tessellation = 0`

Chromatic aberration amount. Gives a cinematic look. Disable to increase performance.
`r_ChromaticAberration=0`

Enables deferred volumetric fog shadows. 0=Off, 1=Standard, 2=Reduced; Example: r_FogShadows=1 (this would set it to standard quality). Disable to increase performance.
`r_FogShadows = 0`

Enables volumetric fog shadows for watervolumes. Disable to increase performance.
`r_FogShadowsWater = 0`

HDR camera grain amount. Gives a cinematic look. Disable to increase performance.
`r_HDRGrainAmount=0`

Image sharpening amount. Gives a cinematic look. Disable to increase performance.
`r_Sharpening=0`

Screen space ambient occlusion: 0 - disabled, 1 - SSAO technique with normals, 2 - SSAO technique with normals and temporal accumulation, 3 - Volumetric Obscurance technique with jittering, 4 - Volumetric Obscurance technique with jittering and temporal accumulation (Consoles only) , 5 - VO variation with multiple radii. Disable to increase performance.
`r_ssao = 0`

An enhancement of Screen space ambient occlusion (SSAO) taking direction into account to sample the ambient light, to better approximate global illumination. Disable to increase performance.
`r_SSDO = 0`

## Other settings
I don't need controller support in this game and don't want it accidentally interfering with my setup.
`i_xinput=0`

Making sure I'm writing a log file, but am decreasing verbosity to the minimum.
`log_writetofile=1`
`log_writetofileverbosity=1`

I want to be able to alt-tab, so I set this
`r_enableAltTab=1`
