-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2025 AllBinary 
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
-- package org.allbinary.android.activity

local ProgressActivityInterface = require("org.allbinary.android.activity.ProgressActivityInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NullProgressActivity = {}
NullProgressActivity.__index = NullProgressActivity
NullProgressActivity.className = "NullProgressActivity"

function NullProgressActivity.new()
    local self = setmetatable({}, NullProgressActivity)
    return self
end


function NullProgressActivity:runOnUiThread(action)
end


function NullProgressActivity:onDismissTitleProgressBar()
end


function NullProgressActivity:onShowTitleProgressBar(value, indeterminate)
end


function NullProgressActivity:onTitleProgressBarSetProgress(value)
end

NullProgressActivity.NULL_PROGRESS_ACTIVITY = NullProgressActivity.new()

return NullProgressActivity

