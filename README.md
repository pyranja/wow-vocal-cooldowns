# Vocal Cooldowns

World of Warcraft addon to announce cooldowns vocally when they become ready.

## History

This addon is isnpired by [CDVA](https://www.curseforge.com/wow/addons/cdva-cooldown-vocal-announcement-retail), but rewritten from scratch:
* uses text-to-speech api instead of pre-recorded sounds
* tracks any cooldown instead of a hardcoded list per class
* uses new spell cooldown plugin api introduced in TWW (thanks to @praesagus from [cdva discord](https://discord.gg/QsPCjx28))
* listens for spell casts via plugin events, instead polling cooldowns in a loop
