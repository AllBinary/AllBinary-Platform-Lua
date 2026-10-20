-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
--  
-- By agreeing to this license you and any business entity you represent are 
-- legally bound to the AllBinary Open License Version 1 legal agreement. 
--  
-- You may obtain the AllBinary Open License Version 1 legal agreement from 
-- AllBinary or the root directory of AllBinary's AllBinary Platform repository. 
--  
-- Created By: Travis Berthelot 
--   
-- Generated Code Do Not Modify
-- package org.allbinary.game.behavior.topview.placement

local TiledMap = require("org.mapeditor.core.TiledMap")
local TileMapPlacementVisitor = require("org.allbinary.game.behavior.topview.placement.TileMapPlacementVisitor")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AllAnimationsEverywhereTileMapPlacementVisitor = {}
AllAnimationsEverywhereTileMapPlacementVisitor.__index = AllAnimationsEverywhereTileMapPlacementVisitor
AllAnimationsEverywhereTileMapPlacementVisitor.className = "AllAnimationsEverywhereTileMapPlacementVisitor"
setmetatable(AllAnimationsEverywhereTileMapPlacementVisitor, {__index = TileMapPlacementVisitor})

function AllAnimationsEverywhereTileMapPlacementVisitor.new()
    local self = setmetatable(TileMapPlacementVisitor.new(), AllAnimationsEverywhereTileMapPlacementVisitor)
    return self
end


function AllAnimationsEverywhereTileMapPlacementVisitor:visit(lastMap, mapData)
        local size = (mapData.n or #mapData)
        local size2 = (mapData[1].n or #mapData[1]) - 7
        for index = 0, size - 1 do
            for index2 = 0, size2 - 1, 7 do
                mapData[index + 1][index2 + 1] = 1
                mapData[index + 1][index2 + 1 + 1] = 17
                mapData[index + 1][index2 + 2 + 1] = 33
                mapData[index + 1][index2 + 3 + 1] = 49
                mapData[index + 1][index2 + 4 + 1] = 65
                mapData[index + 1][index2 + 5 + 1] = 81
                mapData[index + 1][index2 + 6 + 1] = 97
            end
        end
end

return AllAnimationsEverywhereTileMapPlacementVisitor

