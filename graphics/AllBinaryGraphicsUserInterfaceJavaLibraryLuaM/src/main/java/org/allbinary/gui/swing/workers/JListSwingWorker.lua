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
-- package org.allbinary.gui.swing.workers

-- local swing = require("javax.swing")
local SwingWorker = require("org.allbinary.gui.swing.workers.SwingWorker")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local JListSwingWorker = {}
JListSwingWorker.__index = JListSwingWorker
JListSwingWorker.className = "JListSwingWorker"
setmetatable(JListSwingWorker, {__index = SwingWorker})

function JListSwingWorker:_init_fields()
    self.jList = nil
    self.listModel = nil
end


function JListSwingWorker.new(jList, listModel)
    local self = setmetatable(SwingWorker.new(), JListSwingWorker)
    self:_init_fields()
        self:setJList(jList)
        self:setListModel(listModel)
    return self
end


function JListSwingWorker:doInBackground()
        return nil
end


function JListSwingWorker:done()
        self:getJList():setModel(self:getListModel())
end


function JListSwingWorker:getJList()
        return self.jList
end


function JListSwingWorker:setJList(jList)
        self.jList = jList
end


function JListSwingWorker:getListModel()
        return self.listModel
end


function JListSwingWorker:setListModel(listModel)
        self.listModel = listModel
end

return JListSwingWorker

