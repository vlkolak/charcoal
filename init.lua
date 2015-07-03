-- Charcoal mod by vlkolak - 2015
--
-- This mod supplies various charcoal related recipes.
--
-- License: WTFPL
--

print("MOD: charcoal loading")

charcoal = {}
charcoal.version = "0.1.0"
charcoal.lump = "charcoal:charcoal_lump"

charcoal.worldpath = minetest.get_worldpath()
charcoal.modpath = minetest.get_modpath("charcoal")

dofile(charcoal.modpath .. "/settings.txt")
-- Read the external config file if it exists.
if io.open(charcoal.worldpath .. "/charcoal_settings.txt", "r") then
    dofile(charcoal.worldpath .. "/charcoal_settings.txt")
    io.close()
end

if not charcoal.separate_node then
    charcoal.lump = "default:coal_lump"
else
    dofile(charcoal.modpath .. "/separate_node_crafts.lua")
end

-- char some tree to get some charcoal
minetest.register_craft({
        type = "cooking",
        output = charcoal.lump,
        recipe = "group:wood",
})
minetest.register_craft({
        type = "cooking",
        output = charcoal.lump .. " 4",
        recipe = "group:tree",
})

print("MOD: charcoal " .. charcoal.version .. " loaded!")
