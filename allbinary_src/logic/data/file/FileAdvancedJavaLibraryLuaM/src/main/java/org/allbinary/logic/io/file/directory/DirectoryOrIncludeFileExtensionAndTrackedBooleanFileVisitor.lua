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
-- package org.allbinary.logic.io.file.directory

local GitProcessHelper = require("org.allbinary.java.runtime.process.git.GitProcessHelper")
local AbFile = require("org.allbinary.logic.io.file.AbFile")
local CommonDataFileStrings = require("org.allbinary.logic.io.file.CommonDataFileStrings")
local IncludeFileExtensionsBooleanFileVisitor = require("org.allbinary.logic.io.file.visitor.IncludeFileExtensionsBooleanFileVisitor")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor = {}
DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor.__index = DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor
DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor.className = "DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor"
setmetatable(DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor, {__index = IncludeFileExtensionsBooleanFileVisitor})

function DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor:_init_fields()
    self.trackedStrings = TrackedStrings.getInstance()
    self.gitProcessHelper = GitProcessHelper.getInstance()
    self.includesString = nil
end

function DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor.new(...)
    local count = select("#", ...)
    if count == 1 then return DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor._new1(...)
    elseif count == 2 then return DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor._new2(...)
    end
end


function DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor._new1(filterStringBasicArrayList)
    local self = setmetatable(IncludeFileExtensionsBooleanFileVisitor.new(filterStringBasicArrayList), DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor)
    self:_init_fields()
        -- super(...) made self above
        self.includesString = nil
    return self
end


function DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor._new2(filterStringBasicArrayList, includesString)
    local self = setmetatable(IncludeFileExtensionsBooleanFileVisitor.new(filterStringBasicArrayList), DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor)
    self:_init_fields()
        -- super(...) made self above
        self.includesString = includesString
    return self
end


function DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor:visit(file)
        if file:isDirectory() then
            return true
        end
        if self.includesString == nil or file:getAbsolutePath():indexOf(self.includesString) >= 0 then
            return IncludeFileExtensionsBooleanFileVisitor.visit(self, file)
        else
            return false
        end
end


-- Java overloaded method: Lua keeps the last definition
function DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor:visit(file, fileNameString)
        local filePath = file:getPath()
        if IncludeFileExtensionsBooleanFileVisitor.visit(self, file, fileNameString) then
            if not ((string.find(filePath, self.trackedStrings.APPLICATION, 1, true) ~= nil) or (string.find(filePath, self.trackedStrings.APP, 1, true) ~= nil) or (string.find(filePath, self.trackedStrings.HTML_TEMP, 1, true) ~= nil)) then
                if not ((string.find(filePath, self.trackedStrings.TARGET_PATH_WINDOWS, 1, true) ~= nil) or (string.find(filePath, self.trackedStrings.TARGET_PATH_UNIX, 1, true) ~= nil)) then
                    if self.gitProcessHelper:isTracked(file) then
                        return true
                    else
                    end
                else
                end
            else
            end
        end
        return false
end


function DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor.main(args)
        local commonFileStrings = CommonDataFileStrings.getInstance()
        local list = BasicArrayListD.new()
        list:add(commonFileStrings.JAVA)
        local filePath = "G:\\mnt\\bc\\mydev\\games\\ZeptoRacer\\platform\\j2se\\ZeptoRacerStaticPathsJ2SEM\\target\\dependency\\org\\allbinary\\logic\\system\\security\\licensing\\ZeptoRacerPCClientInformation.java"
        local result = DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor.new(list):visit(AbFile.createAbFileFromRawPath(filePath))
        print(filePath .. " is Tracked: " .. tostring(result))
end

return DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor

