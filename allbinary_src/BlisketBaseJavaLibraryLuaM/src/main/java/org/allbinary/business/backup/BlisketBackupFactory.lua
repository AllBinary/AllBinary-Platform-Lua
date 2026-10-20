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
-- package org.allbinary.business.backup

local StoreFrontInterface = require("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local StoreFrontsEntity = require("org.allbinary.data.tables.context.module.storefronts.StoreFrontsEntity")
local StoreFrontsEntityFactory = require("org.allbinary.data.tables.context.module.storefronts.StoreFrontsEntityFactory")
local PATH_GLOBALS = require("org.allbinary.globals.PATH_GLOBALS")
local URLGLOBALS = require("org.allbinary.globals.URLGLOBALS")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local AbFile = require("org.allbinary.logic.io.file.AbFile")
local Directory = require("org.allbinary.logic.io.file.directory.Directory")
local ZipFileUtil = require("org.allbinary.logic.io.file.zip.ZipFileUtil")
local AbPath = require("org.allbinary.logic.io.path.AbPath")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
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

local BlisketBackupFactory = {}
BlisketBackupFactory.__index = BlisketBackupFactory
BlisketBackupFactory.className = "BlisketBackupFactory"

function BlisketBackupFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.stringUtil = StringUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.directory = Directory.getInstance()
end

function BlisketBackupFactory.new()
    local self = setmetatable({}, BlisketBackupFactory)
    self:_init_fields()
    return self
end


function BlisketBackupFactory.getInstance()
        return BlisketBackupFactory.instance
end


-- throws Exception
function BlisketBackupFactory:getFileBasicArrayList(pathString)
        local path = AbPath.new(pathString, self.stringUtil.EMPTY_STRING)
        local file = AbFile.createAbFileFromAbPath(path)
        return self.directory:search(file, true)
end


function BlisketBackupFactory:backup()
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, "backup()")
            local stringBuffer = StringMaker.new()
            stringBuffer:append(self.URLGLOBALS:getWebappPath())
            stringBuffer:append(self.PATH_GLOBALS:getInstance().BACKUP_PATH)
            local backupPath = tostring(stringBuffer)
            local path = AbPath.new(backupPath, self.stringUtil.EMPTY_STRING)
            local fileBasicArrayList = self:getFileBasicArrayList(backupPath)
            self:backup(fileBasicArrayList, tostring(path:toFileSystemString()) .. "backup.zip")
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "backup()", e)
        end
end


function BlisketBackupFactory:backupViews()
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, "backupViews()")
            local stringBuffer = StringMaker.new()
            stringBuffer:append(self.URLGLOBALS:getWebappPath())
            stringBuffer:append(self.PATH_GLOBALS:getInstance().BACKUP_PATH)
            local backupPath = tostring(stringBuffer)
            local path = AbPath.new(backupPath, self.stringUtil.EMPTY_STRING)
            local fileBasicArrayList = BasicArrayListD.new()
            local storeFrontsEntity = StoreFrontsEntityFactory.getInstance():getStoreFrontsEntityInstance()
            local storeFrontNamesBasicArrayList = storeFrontsEntity:getStoreFrontNames()
            local size = storeFrontNamesBasicArrayList:size()
            local nextStore = nil
            local viewsPath = nil
            for index = 0, size - 1 do
                nextStore = storeFrontNamesBasicArrayList:get(index)
                stringBuffer:delete(0, stringBuffer:length())
                stringBuffer:append(self.URLGLOBALS:getWebappPath())
                stringBuffer:append(self.PATH_GLOBALS:getInstance().VIEWS_PATH)
                stringBuffer:append(nextStore)
                viewsPath = tostring(stringBuffer)
                stringBuffer:delete(0, stringBuffer:length())
                stringBuffer:append("Backup Store Views: ")
                stringBuffer:append(nextStore)
                stringBuffer:append(" from: ")
                stringBuffer:append(viewsPath)
                PreLogUtil.put(tostring(stringBuffer), self, "backupViews()")
                fileBasicArrayList:addAllList(self:getFileBasicArrayList(viewsPath))
            end
            self:backup(fileBasicArrayList, tostring(path:toFileSystemString()) .. "backupViews.zip")
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "backupViews()", e)
        end
end


function BlisketBackupFactory:backupResources()
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, "backupResources()")
            local stringBuffer = StringMaker.new()
            stringBuffer:append(self.URLGLOBALS:getWebappPath())
            stringBuffer:append(self.PATH_GLOBALS:getInstance().BACKUP_PATH)
            local backupPath = tostring(stringBuffer)
            local path = AbPath.new(backupPath, self.stringUtil.EMPTY_STRING)
            local fileBasicArrayList = BasicArrayListD.new()
            local storeFrontsEntity = StoreFrontsEntityFactory.getInstance():getStoreFrontsEntityInstance()
            local storeFrontNamesBasicArrayList = storeFrontsEntity:getStoreFrontNames()
            local size = storeFrontNamesBasicArrayList:size()
            local nextStore = nil
            local storeFrontInterface = nil
            local resourcesPath = nil
            for index = 0, size - 1 do
                nextStore = storeFrontNamesBasicArrayList:get(index)
                storeFrontInterface = storeFrontsEntity:getStoreFrontInterface(nextStore)
                stringBuffer:delete(0, stringBuffer:length())
                stringBuffer:append(self.URLGLOBALS:getWebappPath())
                stringBuffer:append(storeFrontInterface:getCurrentHostNamePath())
                stringBuffer:append(storeFrontInterface:getCategoryPath())
                resourcesPath = tostring(stringBuffer)
                stringBuffer:delete(0, stringBuffer:length())
                stringBuffer:append("Backup Store Resrouces: ")
                stringBuffer:append(nextStore)
                stringBuffer:append(" from: ")
                stringBuffer:append(resourcesPath)
                PreLogUtil.put(tostring(stringBuffer), self, "backupResources()")
                fileBasicArrayList:addAllList(self:getFileBasicArrayList(resourcesPath))
            end
            self:backup(fileBasicArrayList, tostring(path:toFileSystemString()) .. "backupResources.zip")
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "backupResources()", e)
        end
end


function BlisketBackupFactory:backupJsps()
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, "backupJsps()")
            local stringBuffer = StringMaker.new()
            stringBuffer:append(self.URLGLOBALS:getWebappPath())
            stringBuffer:append(self.PATH_GLOBALS:getInstance().BACKUP_PATH)
            local backupPath = tostring(stringBuffer)
            local path = AbPath.new(backupPath, self.stringUtil.EMPTY_STRING)
            local fileBasicArrayList = BasicArrayListD.new()
            local storeFrontsEntity = StoreFrontsEntityFactory.getInstance():getStoreFrontsEntityInstance()
            local storeFrontNamesBasicArrayList = storeFrontsEntity:getStoreFrontNames()
            local size = storeFrontNamesBasicArrayList:size()
            local nextStore = nil
            for index = 0, size - 1 do
                nextStore = storeFrontNamesBasicArrayList:get(index)
                PreLogUtil.put("Backup Store Jsps: " .. nextStore, self, "backupJsps()")
                stringBuffer:delete(0, stringBuffer:length())
                stringBuffer:append(self.URLGLOBALS:getWebappPath())
                stringBuffer:append(nextStore)
                fileBasicArrayList:addAllList(self:getFileBasicArrayList(tostring(stringBuffer)))
            end
            self:backup(fileBasicArrayList, tostring(path:toFileSystemString()) .. "backupJsps.zip")
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "backupJsps()", e)
        end
end


-- Java overloaded method: Lua keeps the last definition
function BlisketBackupFactory:backup(fileBasicArrayList, zipFile)
        local try_ok, try_error = pcall(function()
            local stringBuffer = StringMaker.new()
            stringBuffer:delete(0, stringBuffer:length())
            stringBuffer:append("ZipFile: ")
            stringBuffer:append(zipFile)
            stringBuffer:append(" BasicArrayList: ")
            stringBuffer:appendint(fileBasicArrayList:size())
            PreLogUtil.put("Creating Backup Zip File: " .. tostring(stringBuffer), self, "backup()")
            ZipFileUtil.getInstance():create(zipFile, fileBasicArrayList)
            self.logUtil:putF("Created Backup Zip File", self, "backup()")
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "backup()", e)
        end
end

BlisketBackupFactory.instance = BlisketBackupFactory.new()

return BlisketBackupFactory

