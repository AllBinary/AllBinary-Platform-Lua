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
-- package org.allbinary.graphics.j2me.workarea.canvas

local GPoint = require("org.allbinary.graphics.GPoint")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local Grid = {}
Grid.__index = Grid
Grid.className = "Grid"

function Grid:_init_fields()
    self.grid = nil
    self.isGridOn = true
    self.isGridPossible = false
    self.zoom = 3
    self.isChanged = true
end

function Grid.new(...)
    local count = select("#", ...)
    if count == 0 then return Grid._new0(...)
    elseif count == 1 then return Grid._new1(...)
    end
end


function Grid._new0()
    local self = setmetatable({}, Grid)
    self:_init_fields()
    return self
end


function Grid._new1(grid)
    local self = setmetatable({}, Grid)
    self:_init_fields()
        self.grid = grid.grid
        self:showGrid(grid.isGridOn)
        self.isGridPossible = grid.isGridPossible
        self:setZoom(grid:getZoom())
    return self
end


function Grid:isGridOn()
        return self.isGridOn
end


function Grid:isGridPossible()
        return self.isGridPossible
end


function Grid:getGrid()
        return self.grid
end


function Grid:getZoom()
        return self.zoom
end


function Grid:showGrid(value)
        self.isGridOn = value
end


function Grid:setZoom(zoom)
        self.zoom = zoom
        if self.zoom < 1 then
            zoom = 1
        end
        self.isChanged = true
end

return Grid

