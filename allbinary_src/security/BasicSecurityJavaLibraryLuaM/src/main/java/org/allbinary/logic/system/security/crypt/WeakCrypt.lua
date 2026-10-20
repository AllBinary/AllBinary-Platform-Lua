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
-- package org.allbinary.logic.system.security.crypt

local TsUtil = require("org.allbinary.TsUtil")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local AbCrypt = require("org.allbinary.logic.system.security.crypt.jcehelper.AbCrypt")
local KeySpecFactory = require("org.allbinary.logic.system.security.crypt.jcehelper.KeySpecFactory")
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

local WeakCrypt = {}
WeakCrypt.__index = WeakCrypt
WeakCrypt.className = "WeakCrypt"

function WeakCrypt:_init_fields()
    self.tsUtil = TsUtil.getInstance()
    self.abCrypt = AbCrypt.new(KeySpecFactory.getInstance().DES)
end


function WeakCrypt.new(key)
    local self = setmetatable({}, WeakCrypt)
    self:_init_fields()
        local try_ok, try_error = pcall(function()
            self.abCrypt:init(WeakCrypt.keys[key + 1])
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            PreLogUtil.putOE(commonStrings.EXCEPTION, self, "SuperCrypt(key)", e)
        end
    return self
end


function WeakCrypt:encrypt(value)
        local try_ok, try_error = pcall(function()
            local crypted = self.abCrypt:encrypt(self.tsUtil:getByteArray(value))
            return DatabaseEncoder.encode(crypted)
        end)
        if not try_ok then
            local e = try_error
            PreLogUtil.putOE("Encrypt Failed", self, "encrypt", e)
            return StringUtil.getInstance().EMPTY_STRING
        end
end


function WeakCrypt:decrypt(value)
        local try_ok, try_error = pcall(function()
            local decrypted = self.abCrypt:decrypt(DatabaseEncoder.decode(value))
            return string.char(table.unpack(decrypted))
        end)
        if not try_ok then
            local e = try_error
            PreLogUtil.putOE("decrypt Failed", self, "decrypt", e)
            return StringUtil.getInstance().EMPTY_STRING
        end
end

WeakCrypt.keys = {"qwres6qewrupoi1132790jfahleavi89398", "143uk32lngf8675gt1tv9214uvt924ut9u9", "12kvjlvlkv11445v12951v512v9m51295v1", "gampipoiupg4g43y5u238tu2485u20u0932", "a93u5uu02s2d2g3259u4395u409u093u9vu", "nlkxzj90je3mln9l8l89qjf0j3v50j23r9j", "2lk5fn5j23nr8f0233vq35n23jn58vhy843", "9q24334m598t092tkn2iv0982456n425j9g", "5m9uvmt9436243m5v34g09d43i52ki35g99", "n123lr1iubiu2br32lv32rbu23b32ub2rlb", "va0u0iovji2ojpvj2oij22poiu4ov2uv28v", "bkk80gn2v9uc902340ut209pcup0u09utc9", "mn32m32neee23c42fn32nf3mf2n3fn2m3fm", "zcxpozo3423voizupovsijevnv3n33o33n3", "v0345324thv93h03893893vh893v8h3vhzz", "v8na898v8wyef9ty39yv98yaw39yeeyf8ye", "45zd36d34jg09434hfshp8uj9sy8s7cyr78", "b098yy0908vdvh983b2lb327980a76s5e5e", "v90y9v9p8y3r98pagsdgsagyr6y3985yhfh", "vblkzhhzp8yvzi8u4t9856456zy3rv8a388", "da7696023rgf28dssfa98asd879hg32hewe", "afo7d6ffkjb3jr3i34gb24ytuvu3jr3uryf", "4gijvqo8vq984hv984hj5j3511h832hf833"}
WeakCrypt.KEYMAX = (WeakCrypt.keys.n or #WeakCrypt.keys)

return WeakCrypt

