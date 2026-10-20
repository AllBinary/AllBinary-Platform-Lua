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
-- package org.allbinary.image

local ARunnable = require("org.allbinary.thread.ARunnable")
local ImageToolJFrame = require("org.allbinary.image.gui.ImageToolJFrame")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ImageTool = {}
ImageTool.__index = ImageTool
ImageTool.className = "ImageTool"

function ImageTool:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function ImageTool.new()
    local self = setmetatable({}, ImageTool)
    self:_init_fields()
    return self
end


function ImageTool.main(args)
        java.awt.EventQueue:invokeLater((function()
            local o = ARunnable.new and ARunnable.new() or setmetatable({}, {__index = ARunnable})
            

            function o:run()
                local logUtil = LogUtil.getInstance()
                local commonStrings = CommonStrings.getInstance()
                local try_ok, try_error = pcall(function()
                    logUtil:putF(commonStrings.START, self, commonStrings.RUN)
                    ImageToolJFrame.new():setVisible(true)
                end)
                if not try_ok then
                    local e = try_error
                    logUtil:put(commonStrings.EXCEPTION, self, commonStrings.RUN, e)
                end
            end
            return o
        end)())
end

return ImageTool

