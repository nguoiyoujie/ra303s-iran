[Return to Features](./features.md)

## Miscellaneous Changes

This section covers changes that are not part of other sections. Usually these have no controls, so they are either fixes or breaking changes. These should ideally contain only fixes

-------

 - [Combat Changes](#combat-changes)
 - [Fixes](#fixes) 

-------

### Combat Changes

**Explosion no Animination Crash Fix**

In the original game, if a unit using a `Primary` weapon with a warhead with `Anim=NONE` is set to `Explodes=true`, the game will try to animate the null animation ANIM_NONE, which crashes the game.

Now this defaults to ANIM_NAPALM2 (the flame animation). A modder may use a unit's `DeathWeapon` to customize a unit's explosion behavior.

**Negative Damage Weapons**

In the original game, there are checks to restrict the use of negative damage to the Medic and the Mechanic. Moreover, the game restricts the area of effect of such weapons to 8 leptons. Now all weapons can deal negative damage, and the area of effect of the weapon follows the warhead spread factor.

The mechanics of healing is not yet fully unraveled, so negative weapons may not mix nicely with combat weapons.

**Bullet - BallisticScatter, HomingScatter**\
*This experimental change has been reverted for the moment. Expect finer controls in the future.*

Scattering behaviour had changed, which may mean a greater spread of bullets for units with `Inaccurate` set to true, as well as situations that the game applies inaccuracy to. This may change in the future.

-------

### Fixes

**Overriding Building Power Supply/Drain**

Originally, if the power of the original building was negative (drains power), modifications by ini with a positive number will still perform the drain.

The drain amount is now reset when a positive power supply is defined for a building.

