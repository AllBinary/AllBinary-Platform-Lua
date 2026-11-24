--
-- AllBinary Open License Version 1
-- Copyright (c) 2011 AllBinary
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
-- package org.allbinary.game.collision.layer

local AllBinaryCollisionManager = {}
package.loaded["org.allbinary.game.collision.layer.AllBinaryCollisionManager"] = AllBinaryCollisionManager

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local CollidableBaseBehavior = java_lazy("org.allbinary.game.collision.CollidableBaseBehavior")
local CollidableInterfaceCompositeInterface = java_lazy("org.allbinary.game.collision.CollidableInterfaceCompositeInterface")
local CollidableCompositeLayer = java_lazy("org.allbinary.game.layer.CollidableCompositeLayer")
local LayerManager = java_lazy("org.allbinary.layer.LayerManager")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table AllBinaryCollisionManager is declared before the requires
AllBinaryCollisionManager.__index = AllBinaryCollisionManager
AllBinaryCollisionManager.className = "AllBinaryCollisionManager"
AllBinaryCollisionManager.javaClassName = "org.allbinary.game.collision.layer.AllBinaryCollisionManager"


function AllBinaryCollisionManager._jinit(self)
    return self
end

function AllBinaryCollisionManager.new(...)
    local self = setmetatable({}, AllBinaryCollisionManager)
    AllBinaryCollisionManager._jinit(self, ...)
    return self
end


function AllBinaryCollisionManager.getInstance()
        return AllBinaryCollisionManager.allBinaryCollisionManager
end


-- throws Exception
function AllBinaryCollisionManager:process(layerManager, collidableInterfaceCompositeInterface, startIndex)
        local size = layerManager:getSize()
        for index = startIndex + 1, size - 1 do
            local collidableInterfaceCompositeInterface2 = layerManager:getLayerAt(index)
            self:collide(layerManager, collidableInterfaceCompositeInterface, collidableInterfaceCompositeInterface2)
        end
end


-- throws Exception
function AllBinaryCollisionManager:collide(layerManager, collidableInterfaceCompositeInterface, collidableInterfaceCompositeInterface2)
        local collidableBase2 = collidableInterfaceCompositeInterface2:getCollidableInferface()
        local collidableBase = collidableInterfaceCompositeInterface:getCollidableInferface()
        if collidableBase2:isCollidable(collidableInterfaceCompositeInterface) then
            if collidableBase:isCollisionInterface(collidableInterfaceCompositeInterface, collidableInterfaceCompositeInterface2) then
                collidableBase:collideInterface(collidableInterfaceCompositeInterface, collidableInterfaceCompositeInterface2)
                collidableBase2:collideInterface(collidableInterfaceCompositeInterface, collidableInterfaceCompositeInterface)
            end
        end
end

AllBinaryCollisionManager.allBinaryCollisionManager = AllBinaryCollisionManager.new()

return AllBinaryCollisionManager

