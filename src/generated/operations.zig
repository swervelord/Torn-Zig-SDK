// Generated exact operation contracts.
const model = @import("../model.zig");
const current = @import("current.zig");
const RaceClassEnum = current.RaceClassEnum;
const TornItemStatTitleEnum = current.TornItemStatTitleEnum;
const FactionArmoryCategoryEnum = current.FactionArmoryCategoryEnum;
const MissionDifficultyEnum = current.MissionDifficultyEnum;
const MissionStatusEnum = current.MissionStatusEnum;
const MissionRewardUpgrade = current.MissionRewardUpgrade;
const UserDonatorStatusEnum = current.UserDonatorStatusEnum;
const UserMessageTypeEnum = current.UserMessageTypeEnum;
const JobTypeEnum = current.JobTypeEnum;
const UserMaritalStatusEnum = current.UserMaritalStatusEnum;
const UserLastActionStatusEnum = current.UserLastActionStatusEnum;
const UserPlaneImageTypeEnum = current.UserPlaneImageTypeEnum;
const UserFlyMethodEnum = current.UserFlyMethodEnum;
const UserStatusStateEnum = current.UserStatusStateEnum;
const UserRoleEnum = current.UserRoleEnum;
const UserTitleEnum = current.UserTitleEnum;
const UserRankEnum = current.UserRankEnum;
const UserRpsStatus = current.UserRpsStatus;
const UserSkillSlugEnum = current.UserSkillSlugEnum;
const CountryEnum = current.CountryEnum;
const ReportTypeEnum = current.ReportTypeEnum;
const ApiKeyAccessTypeEnum = current.ApiKeyAccessTypeEnum;
const FactionTerritoryEnum = current.FactionTerritoryEnum;
const FactionStatEnum = current.FactionStatEnum;
const FactionBranchStateEnum = current.FactionBranchStateEnum;
const RacingRaceTypeEnum = current.RacingRaceTypeEnum;
const MarketSpecializedBazaarCategoryEnum = current.MarketSpecializedBazaarCategoryEnum;
const FactionPositionAbilityEnum = current.FactionPositionAbilityEnum;
const FactionOrganizedCrimePayoutType = current.FactionOrganizedCrimePayoutType;
const TornRacketType = current.TornRacketType;
const FactionNewsCategory = current.FactionNewsCategory;
const CompanyNewsCategory = current.CompanyNewsCategory;
const FactionRankEnum = current.FactionRankEnum;
const UserCrimeUniquesRewardAmmoEnum = current.UserCrimeUniquesRewardAmmoEnum;
const RaceStatusEnum = current.RaceStatusEnum;
const TornHofCategory = current.TornHofCategory;
const TornFactionHofCategory = current.TornFactionHofCategory;
const TornOrganizedCrimePositionId = current.TornOrganizedCrimePositionId;
const TornOrganizedCrimePositionIdDeprecated = current.TornOrganizedCrimePositionIdDeprecated;
const FactionTerritoryWarResultEnum = current.FactionTerritoryWarResultEnum;
const FactionAttackResult = current.FactionAttackResult;
const RaceCarUpgradeCategory = current.RaceCarUpgradeCategory;
const JobPositionArmyEnum = current.JobPositionArmyEnum;
const JobPositionGrocerEnum = current.JobPositionGrocerEnum;
const WeaponBonusEnum = current.WeaponBonusEnum;
const UserListEnum = current.UserListEnum;
const JobPositionCasinoEnum = current.JobPositionCasinoEnum;
const AttackFinishingHitEffect = current.AttackFinishingHitEffect;
const ApiFiltersAttacksRevivesEnum = current.ApiFiltersAttacksRevivesEnum;
const JobPositionMedicalEnum = current.JobPositionMedicalEnum;
const JobPositionLawEnum = current.JobPositionLawEnum;
const JobPositionEducationEnum = current.JobPositionEducationEnum;
const RaceCarUpgradeSubCategory = current.RaceCarUpgradeSubCategory;
const ApplicationStatusEnum = current.ApplicationStatusEnum;
const FactionRankedWarsCategoryEnum = current.FactionRankedWarsCategoryEnum;
const FactionTerritoryWarsCategoryEnum = current.FactionTerritoryWarsCategoryEnum;
const TradeCategoryEnum = current.TradeCategoryEnum;
const FactionCrimeUserOutcome = current.FactionCrimeUserOutcome;
const FactionCrimeUserItemOutcomeEnum = current.FactionCrimeUserItemOutcomeEnum;
const FactionCrimeItemOutcomeEnum = current.FactionCrimeItemOutcomeEnum;
const RaceId = current.RaceId;
const HonorId = current.HonorId;
const MedalId = current.MedalId;
const MeritId = current.MeritId;
const OrganizedCrimeName = current.OrganizedCrimeName;
const PropertyTypeId = current.PropertyTypeId;
const PropertyId = current.PropertyId;
const DirtyBombId = current.DirtyBombId;
const RaceTrackId = current.RaceTrackId;
const RaceCarId = current.RaceCarId;
const RaceCarUpgradeId = current.RaceCarUpgradeId;
const ItemId = current.ItemId;
const ItemStatId = current.ItemStatId;
const AuctionListingId = current.AuctionListingId;
const ItemModId = current.ItemModId;
const CityShopId = current.CityShopId;
const AmmoId = current.AmmoId;
const RankedWarId = current.RankedWarId;
const TerritoryWarId = current.TerritoryWarId;
const RaidWarId = current.RaidWarId;
const ItemUid = current.ItemUid;
const UserId = current.UserId;
const CompanyPositionId = current.CompanyPositionId;
const CompanySpecialId = current.CompanySpecialId;
const CompanyStockId = current.CompanyStockId;
const TradeId = current.TradeId;
const PokerTableId = current.PokerTableId;
const StockId = current.StockId;
const DiscordId = current.DiscordId;
const UserDiscordPathId = current.UserDiscordPathId;
const EliminationTeamId = current.EliminationTeamId;
const UserMessageId = current.UserMessageId;
const UserEventId = current.UserEventId;
const UserIconId = current.UserIconId;
const ReviveId = current.ReviveId;
const LogId = current.LogId;
const UserLogId = current.UserLogId;
const LogCategoryId = current.LogCategoryId;
const FactionId = current.FactionId;
const CompanyId = current.CompanyId;
const CompanyTypeId = current.CompanyTypeId;
const EducationId = current.EducationId;
const FactionBranchId = current.FactionBranchId;
const FactionCrimeId = current.FactionCrimeId;
const TornCrimeId = current.TornCrimeId;
const TornSubCrimeId = current.TornSubCrimeId;
const HalloweenBasketUpgradeId = current.HalloweenBasketUpgradeId;
const ChainId = current.ChainId;
const AttackId = current.AttackId;
const AttackCode = current.AttackCode;
const ForumId = current.ForumId;
const ForumThreadId = current.ForumThreadId;
const GymId = current.GymId;
const ForumPostId = current.ForumPostId;
const RequestLinks = current.RequestLinks;
const RequestMetadata = current.RequestMetadata;
const RequestMetadataWithLinks = current.RequestMetadataWithLinks;
const RequestMetadataWithLinksAndTotal = current.RequestMetadataWithLinksAndTotal;
const RequestMetadataWithLinksAndNanostamp = current.RequestMetadataWithLinksAndNanostamp;
const ForumFeedTypeEnum = current.ForumFeedTypeEnum;
const GymClassEnum = current.GymClassEnum;
const ShopNameEnum = current.ShopNameEnum;
const UserGenderEnum = current.UserGenderEnum;
const CompanyStaffRoomSizeEnum = current.CompanyStaffRoomSizeEnum;
const CompanyStorageSizeEnum = current.CompanyStorageSizeEnum;
const HonorRarityEnum = current.HonorRarityEnum;
const AwardCrimesVersionEnum = current.AwardCrimesVersionEnum;
const CompanySearchParameter = current.CompanySearchParameter;
const UserSearchParameter = current.UserSearchParameter;
const Parameters = current.Parameters;
const TornShopliftingStatusTitleEnum = current.TornShopliftingStatusTitleEnum;
const ReviveSetting = current.ReviveSetting;
const FactionWarfareTypeEnum = current.FactionWarfareTypeEnum;
const PropertyModificationEnum = current.PropertyModificationEnum;
const PropertyStaffEnum = current.PropertyStaffEnum;
const FactionCrimeStatusEnum = current.FactionCrimeStatusEnum;
const AttackActionEnum = current.AttackActionEnum;
const TornItemAmmoTypeEnum = current.TornItemAmmoTypeEnum;
const TornItemWeaponTypeEnum = current.TornItemWeaponTypeEnum;
const TornItemWeaponCategoryEnum = current.TornItemWeaponCategoryEnum;
const MedalTypeEnum = current.MedalTypeEnum;
const HonorTypeEnum = current.HonorTypeEnum;
const TornItemTypeEnum = current.TornItemTypeEnum;
const TornItemCategory = current.TornItemCategory;
const TornInventoryItemType = current.TornInventoryItemType;
const TornItemArmorCoveragePartEnum = current.TornItemArmorCoveragePartEnum;
const UserFactionBasic = current.UserFactionBasic;
const AttackPlayer = current.AttackPlayer;
const AttackPlayerSimplified = current.AttackPlayerSimplified;
const AttackingFinishingHitEffects = current.AttackingFinishingHitEffects;
const Attack = current.Attack;
const AttackSimplified = current.AttackSimplified;
const ReviveSimplified = current.ReviveSimplified;
const Revive = current.Revive;
const RevivesResponse = current.RevivesResponse;
const RevivesFullResponse = current.RevivesFullResponse;
const TimestampResponse = current.TimestampResponse;
const ReportBase = current.ReportBase;
const ReportWarrantDetails = current.ReportWarrantDetails;
const ReportMostWanted = current.ReportMostWanted;
const ReportMoney = current.ReportMoney;
const ReportInvestment = current.ReportInvestment;
const ReportTrueLevel = current.ReportTrueLevel;
const ReportStats = current.ReportStats;
const ReportHistoryFaction = current.ReportHistoryFaction;
const ReportHistoryCompany = current.ReportHistoryCompany;
const ReportHistory = current.ReportHistory;
const ReportFriendOrFoeUser = current.ReportFriendOrFoeUser;
const ReportFriendOrFoe = current.ReportFriendOrFoe;
const ReportCompanyFinancials = current.ReportCompanyFinancials;
const ReportStockAnalysis = current.ReportStockAnalysis;
const ReportAnonymousBounties = current.ReportAnonymousBounties;
const ReportReport = current.ReportReport;
const Report = current.Report;
const ReportsResponse = current.ReportsResponse;
const SelectionCategoryEnum = current.SelectionCategoryEnum;
const ErrorUnknown = current.ErrorUnknown;
const ErrorKeyEmpty = current.ErrorKeyEmpty;
const ErrorIncorrectKey = current.ErrorIncorrectKey;
const ErrorWrongType = current.ErrorWrongType;
const ErrorWrongFields = current.ErrorWrongFields;
const ErrorTooManyRequests = current.ErrorTooManyRequests;
const ErrorIncorrectId = current.ErrorIncorrectId;
const ErrorIncorrectIdEntityRelation = current.ErrorIncorrectIdEntityRelation;
const ErrorIpBlocked = current.ErrorIpBlocked;
const ErrorApiDisabled = current.ErrorApiDisabled;
const ErrorKeyOwnerInFederalJail = current.ErrorKeyOwnerInFederalJail;
const ErrorKeyChangeCooldown = current.ErrorKeyChangeCooldown;
const ErrorKeyReadError = current.ErrorKeyReadError;
const ErrorKeyTemporaryDisabled = current.ErrorKeyTemporaryDisabled;
const ErrorDailyReadLimitReached = current.ErrorDailyReadLimitReached;
const ErrorLogUnavailable = current.ErrorLogUnavailable;
const ErrorAccessLevelTooLow = current.ErrorAccessLevelTooLow;
const ErrorBackendError = current.ErrorBackendError;
const ErrorApiKeyPaused = current.ErrorApiKeyPaused;
const ErrorMustMigrateToCrimesV2 = current.ErrorMustMigrateToCrimesV2;
const ErrorRaceNotFinished = current.ErrorRaceNotFinished;
const ErrorIncorrectCategory = current.ErrorIncorrectCategory;
const ErrorOnlyAvailableInApiV1 = current.ErrorOnlyAvailableInApiV1;
const ErrorOnlyAvailableInApiV2 = current.ErrorOnlyAvailableInApiV2;
const ErrorClosedTemporarily = current.ErrorClosedTemporarily;
const ErrorInvalidStatRequested = current.ErrorInvalidStatRequested;
const ErrorOnlyCategoryOrStatsAllowed = current.ErrorOnlyCategoryOrStatsAllowed;
const ErrorMustMigrateToOrganizedCrimesV2 = current.ErrorMustMigrateToOrganizedCrimesV2;
const ErrorIncorrectLogId = current.ErrorIncorrectLogId;
const ErrorCategorySelectionUnavailableForInteractionLogs = current.ErrorCategorySelectionUnavailableForInteractionLogs;
const ErrorFileDoesNotExist = current.ErrorFileDoesNotExist;
const ErrorCityStatsCronFailed = current.ErrorCityStatsCronFailed;
const ErrorEndpointClosedUntilAttackingPeriod = current.ErrorEndpointClosedUntilAttackingPeriod;
const ErrorNoCompetitionAvailable = current.ErrorNoCompetitionAvailable;
const ApiError = current.ApiError;
const UserGymResponse = current.UserGymResponse;
const UserSearch = current.UserSearch;
const UserSearchResponse = current.UserSearchResponse;
const UserPerksResponse = current.UserPerksResponse;
const UserNetworthResponse = current.UserNetworthResponse;
const UserItemMod = current.UserItemMod;
const UserItemModsResponse = current.UserItemModsResponse;
const UserTradesResponse = current.UserTradesResponse;
const UserCasinoResponse = current.UserCasinoResponse;
const UserInventoryItem = current.UserInventoryItem;
const UserInventory = current.UserInventory;
const UserInventoryResponse = current.UserInventoryResponse;
const UserTradeResponse = current.UserTradeResponse;
const UserTrade = current.UserTrade;
const UserTradeParticipant = current.UserTradeParticipant;
const UserTradeDetailed = current.UserTradeDetailed;
const TradeItemNap = current.TradeItemNap;
const TradeItemMoney = current.TradeItemMoney;
const TradeItemFaction = current.TradeItemFaction;
const TradeItemProperty = current.TradeItemProperty;
const TradeItemCompany = current.TradeItemCompany;
const TradeItemItem = current.TradeItemItem;
const TradeItem = current.TradeItem;
const UserStockTransaction = current.UserStockTransaction;
const UserStock = current.UserStock;
const UserStocksResponse = current.UserStocksResponse;
const UserOrganizedCrimesResponse = current.UserOrganizedCrimesResponse;
const UserEquipmentAmmo = current.UserEquipmentAmmo;
const UserEquipment = current.UserEquipment;
const UserEquipmentItemMod = current.UserEquipmentItemMod;
const UserClothing = current.UserClothing;
const UserEquipmentResponse = current.UserEquipmentResponse;
const UserDiscordResponse = current.UserDiscordResponse;
const UserWeaponExpResponse = current.UserWeaponExpResponse;
const UserWeaponExp = current.UserWeaponExp;
const MissionRewardDetailsAmmo = current.MissionRewardDetailsAmmo;
const MissionRewardDetailsUpgrade = current.MissionRewardDetailsUpgrade;
const MissionRewardDetailsItem = current.MissionRewardDetailsItem;
const UserMissionsResponse = current.UserMissionsResponse;
const UserVirus = current.UserVirus;
const UserVirusResponse = current.UserVirusResponse;
const UserTravelResponse = current.UserTravelResponse;
const UserRefillsResponse = current.UserRefillsResponse;
const UserNotificationsResponse = current.UserNotificationsResponse;
const UserCooldownsResponse = current.UserCooldownsResponse;
const UserBar = current.UserBar;
const UserBars = current.UserBars;
const UserBarsResponse = current.UserBarsResponse;
const UserNewEventsResponse = current.UserNewEventsResponse;
const UserEventsResponse = current.UserEventsResponse;
const UserEvent = current.UserEvent;
const UserMessagesResponse = current.UserMessagesResponse;
const UserNewMessagesResponse = current.UserNewMessagesResponse;
const UserMessage = current.UserMessage;
const UserIconPublic = current.UserIconPublic;
const UserIconPrivate = current.UserIconPrivate;
const UserIconsResponse = current.UserIconsResponse;
const UserCompetitionHalloween = current.UserCompetitionHalloween;
const UserCompetitionEasterEggs = current.UserCompetitionEasterEggs;
const UserCompetitionElimination = current.UserCompetitionElimination;
const UserCompetitionRps = current.UserCompetitionRps;
const UserCompetitionResponse = current.UserCompetitionResponse;
const UserFaction = current.UserFaction;
const UserFactionResponse = current.UserFactionResponse;
const UserJob = current.UserJob;
const UserCompany = current.UserCompany;
const UserJobResponse = current.UserJobResponse;
const ProfileSpouse = current.ProfileSpouse;
const UserProfileResponse = current.UserProfileResponse;
const UserMoneyResponse = current.UserMoneyResponse;
const UserSkillsResponse = current.UserSkillsResponse;
const UserSkillDetail = current.UserSkillDetail;
const UserJobPointsResponse = current.UserJobPointsResponse;
const UserCompanyPoints = current.UserCompanyPoints;
const UserWorkStatsResponse = current.UserWorkStatsResponse;
const UserBattleStatsResponse = current.UserBattleStatsResponse;
const UserBattleStatDetail = current.UserBattleStatDetail;
const UserBattleStatModifierDetail = current.UserBattleStatModifierDetail;
const UserAmmoResponse = current.UserAmmoResponse;
const UserAmmo = current.UserAmmo;
const UserAmmoType = current.UserAmmoType;
const UserBasic = current.UserBasic;
const UserBasicResponse = current.UserBasicResponse;
const UserLog = current.UserLog;
const UserLogsResponse = current.UserLogsResponse;
const BasicUser = current.BasicUser;
const UserPropertyBasicDetails = current.UserPropertyBasicDetails;
const UserPropertyDetailsExtended = current.UserPropertyDetailsExtended;
const UserPropertyDetailsExtendedWithRent = current.UserPropertyDetailsExtendedWithRent;
const UserPropertyDetails = current.UserPropertyDetails;
const UserPropertyDetailsExtendedRented = current.UserPropertyDetailsExtendedRented;
const UserPropertyDetailsExtendedForRent = current.UserPropertyDetailsExtendedForRent;
const UserPropertyDetailsExtendedForSale = current.UserPropertyDetailsExtendedForSale;
const UserPropertiesResponse = current.UserPropertiesResponse;
const UserPropertyResponse = current.UserPropertyResponse;
const PropertyPropertyResponse = current.PropertyPropertyResponse;
const UserCurrentEducation = current.UserCurrentEducation;
const UserEducation = current.UserEducation;
const UserEducationResponse = current.UserEducationResponse;
const UserCrimeDetailsBootlegging = current.UserCrimeDetailsBootlegging;
const UserCrimeDetailsGraffiti = current.UserCrimeDetailsGraffiti;
const UserCrimeDetailsShoplifting = current.UserCrimeDetailsShoplifting;
const UserCrimeDetailsCardSkimming = current.UserCrimeDetailsCardSkimming;
const UserCrimeDetailsHustling = current.UserCrimeDetailsHustling;
const UserCrimeDetailsCracking = current.UserCrimeDetailsCracking;
const UserCrimeDetailsScamming = current.UserCrimeDetailsScamming;
const UserSubcrime = current.UserSubcrime;
const UserCrimeRewardAmmo = current.UserCrimeRewardAmmo;
const UserCrimeRewardItem = current.UserCrimeRewardItem;
const UserCrimeRewards = current.UserCrimeRewards;
const UserCrimeAttempts = current.UserCrimeAttempts;
const UserCrimeUniquesRewardMoney = current.UserCrimeUniquesRewardMoney;
const UserCrimeUniquesRewardAmmo = current.UserCrimeUniquesRewardAmmo;
const UserCrimeUniquesReward = current.UserCrimeUniquesReward;
const UserCrimeUniques = current.UserCrimeUniques;
const UserCrimesResponse = current.UserCrimesResponse;
const UserCrime = current.UserCrime;
const UserRacesResponse = current.UserRacesResponse;
const UserRaceCarDetails = current.UserRaceCarDetails;
const UserEnlistedCarsResponse = current.UserEnlistedCarsResponse;
const UserForumPostsResponse = current.UserForumPostsResponse;
const UserForumThreadsResponse = current.UserForumThreadsResponse;
const UserForumSubscribedThreadsResponse = current.UserForumSubscribedThreadsResponse;
const UserForumFeedResponse = current.UserForumFeedResponse;
const UserForumFriendsResponse = current.UserForumFriendsResponse;
const HofValue = current.HofValue;
const HofValueFloat = current.HofValueFloat;
const HofValueString = current.HofValueString;
const UserHofStats = current.UserHofStats;
const UserHofResponse = current.UserHofResponse;
const UserCalendar = current.UserCalendar;
const UserCalendarResponse = current.UserCalendarResponse;
const UserBountiesResponse = current.UserBountiesResponse;
const UserJobRanks = current.UserJobRanks;
const UserJobRanksResponse = current.UserJobRanksResponse;
const UserItemMarkeListingItemDetails = current.UserItemMarkeListingItemDetails;
const UserItemMarketListing = current.UserItemMarketListing;
const UserItemMarketResponse = current.UserItemMarketResponse;
const UserFactionBalance = current.UserFactionBalance;
const UserFactionBalanceResponse = current.UserFactionBalanceResponse;
const UserOrganizedCrimeError = current.UserOrganizedCrimeError;
const UserOrganizedCrimeResponse = current.UserOrganizedCrimeResponse;
const UserList = current.UserList;
const UserListResponse = current.UserListResponse;
const UserSelectionName = current.UserSelectionName;
const UserLookupResponse = current.UserLookupResponse;
const UserHonor = current.UserHonor;
const UserHonorsResponse = current.UserHonorsResponse;
const UserMedal = current.UserMedal;
const UserMedalsResponse = current.UserMedalsResponse;
const UserMeritUpgrade = current.UserMeritUpgrade;
const UserMerits = current.UserMerits;
const UserMeritsResponse = current.UserMeritsResponse;
const UserHalloween = current.UserHalloween;
const UserHalloweenBasketUpgrade = current.UserHalloweenBasketUpgrade;
const UserHalloweenResponse = current.UserHalloweenResponse;
const PersonalStatsOther = current.PersonalStatsOther;
const PersonalStatsOtherPopular = current.PersonalStatsOtherPopular;
const PersonalStatsNetworthExtended = current.PersonalStatsNetworthExtended;
const PersonalStatsNetworthPublic = current.PersonalStatsNetworthPublic;
const PersonalStatsRacing = current.PersonalStatsRacing;
const PersonalStatsMissions = current.PersonalStatsMissions;
const PersonalStatsDrugs = current.PersonalStatsDrugs;
const PersonalStatsTravel = current.PersonalStatsTravel;
const PersonalStatsTravelPopular = current.PersonalStatsTravelPopular;
const PersonalStatsItems = current.PersonalStatsItems;
const PersonalStatsItemsPopular = current.PersonalStatsItemsPopular;
const PersonalStatsInvestments = current.PersonalStatsInvestments;
const PersonalStatsBounties = current.PersonalStatsBounties;
const PersonalStatsCrimesV2 = current.PersonalStatsCrimesV2;
const PersonalStatsCrimesV1 = current.PersonalStatsCrimesV1;
const PersonalStatsCrimesPopular = current.PersonalStatsCrimesPopular;
const PersonalStatsCommunication = current.PersonalStatsCommunication;
const PersonalStatsFinishingHits = current.PersonalStatsFinishingHits;
const PersonalStatsHospital = current.PersonalStatsHospital;
const PersonalStatsHospitalPopular = current.PersonalStatsHospitalPopular;
const PersonalStatsJail = current.PersonalStatsJail;
const PersonalStatsTrading = current.PersonalStatsTrading;
const PersonalStatsJobsPublic = current.PersonalStatsJobsPublic;
const PersonalStatsJobsExtended = current.PersonalStatsJobsExtended;
const PersonalStatsBattleStats = current.PersonalStatsBattleStats;
const PersonalStatsAttackingPublic = current.PersonalStatsAttackingPublic;
const PersonalStatsAttackingExtended = current.PersonalStatsAttackingExtended;
const PersonalStatsAttackingPopular = current.PersonalStatsAttackingPopular;
const PersonalStatsHistoricStat = current.PersonalStatsHistoricStat;
const UserPersonalStatsHistoric = current.UserPersonalStatsHistoric;
const PersonalStatsCrimes = current.PersonalStatsCrimes;
const UserPersonalStatsPopular = current.UserPersonalStatsPopular;
const UserPersonalStatsCategory = current.UserPersonalStatsCategory;
const UserPersonalStatsFull = current.UserPersonalStatsFull;
const UserPersonalStatsFullPublic = current.UserPersonalStatsFullPublic;
const UserPersonalStatsResponse = current.UserPersonalStatsResponse;
const PersonalStatsCategoryEnum = current.PersonalStatsCategoryEnum;
const PersonalStatsStatName = current.PersonalStatsStatName;
const FactionCrimeExpResponse = current.FactionCrimeExpResponse;
const FactionInventoryItem = current.FactionInventoryItem;
const FactionInventoryResponse = current.FactionInventoryResponse;
const FactionRaidReport = current.FactionRaidReport;
const FactionSlotPositionInfo = current.FactionSlotPositionInfo;
const FactionRaidReportFaction = current.FactionRaidReportFaction;
const FactionRaidReportAttacker = current.FactionRaidReportAttacker;
const FactionRaidReportUser = current.FactionRaidReportUser;
const FactionRaidWarReportResponse = current.FactionRaidWarReportResponse;
const FactionWarfareDirtyBomb = current.FactionWarfareDirtyBomb;
const FactionWarfareDirtyBombTargetFaction = current.FactionWarfareDirtyBombTargetFaction;
const FactionWarfareDirtyBombPlanter = current.FactionWarfareDirtyBombPlanter;
const FactionRaidWarfare = current.FactionRaidWarfare;
const FactionRaidWarfareFaction = current.FactionRaidWarfareFaction;
const FactionTerritoryWarfare = current.FactionTerritoryWarfare;
const FactionTerritoryWarFactionWallPlayers = current.FactionTerritoryWarFactionWallPlayers;
const FactionTerritoryWarFaction = current.FactionTerritoryWarFaction;
const FactionTerritoryWarFinishedFaction = current.FactionTerritoryWarFinishedFaction;
const FactionSearchLeader = current.FactionSearchLeader;
const FactionSearch = current.FactionSearch;
const FactionSearchResponse = current.FactionSearchResponse;
const FactionTerritoryWarFinished = current.FactionTerritoryWarFinished;
const FactionTerritoryWarOngoingFaction = current.FactionTerritoryWarOngoingFaction;
const FactionTerritoryWarOngoing = current.FactionTerritoryWarOngoing;
const FactionTerritoryWarsHistoryResponse = current.FactionTerritoryWarsHistoryResponse;
const FactionTerritoryWarReportMembers = current.FactionTerritoryWarReportMembers;
const FactionTerritoryWarReportFaction = current.FactionTerritoryWarReportFaction;
const FactionTerritoryWarReport = current.FactionTerritoryWarReport;
const FactionTerritoryWarReportResponse = current.FactionTerritoryWarReportResponse;
const FactionTerritoryOwnership = current.FactionTerritoryOwnership;
const FactionTerritoriesOwnershipResponse = current.FactionTerritoriesOwnershipResponse;
const TornRacketReward = current.TornRacketReward;
const TornRacket = current.TornRacket;
const FactionRacketsResponse = current.FactionRacketsResponse;
const FactionTerritory = current.FactionTerritory;
const FactionTerritoriesResponse = current.FactionTerritoriesResponse;
const FactionPosition = current.FactionPosition;
const FactionPositionsResponse = current.FactionPositionsResponse;
const FactionUpgradeDetails = current.FactionUpgradeDetails;
const FactionBranchDetails = current.FactionBranchDetails;
const FactionUpgrades = current.FactionUpgrades;
const FactionUpgradesResponse = current.FactionUpgradesResponse;
const FactionStat = current.FactionStat;
const FactionStatsResponse = current.FactionStatsResponse;
const FactionContributor = current.FactionContributor;
const FactionContributorsResponse = current.FactionContributorsResponse;
const FactionHofStats = current.FactionHofStats;
const FactionHofResponse = current.FactionHofResponse;
const FactionMember = current.FactionMember;
const UserLastAction = current.UserLastAction;
const UserStatus = current.UserStatus;
const FactionMembersResponse = current.FactionMembersResponse;
const FactionRank = current.FactionRank;
const FactionBasic = current.FactionBasic;
const FactionBasicResponse = current.FactionBasicResponse;
const FactionPact = current.FactionPact;
const FactionRankedWarParticipant = current.FactionRankedWarParticipant;
const FactionRankedWar = current.FactionRankedWar;
const FactionRaidWarParticipant = current.FactionRaidWarParticipant;
const FactionRaidWar = current.FactionRaidWar;
const FactionTerritoryWarParticipant = current.FactionTerritoryWarParticipant;
const FactionTerritoryWar = current.FactionTerritoryWar;
const FactionWars = current.FactionWars;
const FactionWarsResponse = current.FactionWarsResponse;
const News = current.News;
const NewsResponse = current.NewsResponse;
const FactionRaidsResponse = current.FactionRaidsResponse;
const AttacksResponse = current.AttacksResponse;
const AttacksFullResponse = current.AttacksFullResponse;
const FactionApplication = current.FactionApplication;
const FactionApplicationsResponse = current.FactionApplicationsResponse;
const FactionOngoingChain = current.FactionOngoingChain;
const FactionOngoingChainResponse = current.FactionOngoingChainResponse;
const FactionChain = current.FactionChain;
const FactionChainWarfare = current.FactionChainWarfare;
const FactionChainsResponse = current.FactionChainsResponse;
const FactionChainReportResponse = current.FactionChainReportResponse;
const FactionChainReport = current.FactionChainReport;
const FactionChainReportDetails = current.FactionChainReportDetails;
const FactionChainReportBonus = current.FactionChainReportBonus;
const FactionChainReportAttacker = current.FactionChainReportAttacker;
const FactionChainReportAttackerRespect = current.FactionChainReportAttackerRespect;
const FactionChainReportAttackerAttacks = current.FactionChainReportAttackerAttacks;
const FactionCrimeUserItemOutcome = current.FactionCrimeUserItemOutcome;
const FactionCrimeUser = current.FactionCrimeUser;
const FactionCrimeRewardItem = current.FactionCrimeRewardItem;
const FactionCrimeRewardPayout = current.FactionCrimeRewardPayout;
const FactionCrimeReward = current.FactionCrimeReward;
const FactionCrimeSlot = current.FactionCrimeSlot;
const FactionCrime = current.FactionCrime;
const FactionCrimesResponse = current.FactionCrimesResponse;
const FactionCrimeResponse = current.FactionCrimeResponse;
const FactionBalance = current.FactionBalance;
const FactionBalanceResponse = current.FactionBalanceResponse;
const FactionSelectionName = current.FactionSelectionName;
const FactionLookupResponse = current.FactionLookupResponse;
const FactionRankedWarDetails = current.FactionRankedWarDetails;
const FactionRankedWarResponse = current.FactionRankedWarResponse;
const FactionWarfareRankedResponse = current.FactionWarfareRankedResponse;
const FactionWarfareRaidsResponse = current.FactionWarfareRaidsResponse;
const FactionWarfareTerritoryWarsResponse = current.FactionWarfareTerritoryWarsResponse;
const FactionWarfareChainsResponse = current.FactionWarfareChainsResponse;
const FactionWarfareDirtyBombsResponse = current.FactionWarfareDirtyBombsResponse;
const FactionWarfareResponse = current.FactionWarfareResponse;
const FactionRankedWarReportResponse = current.FactionRankedWarReportResponse;
const CompanySelectionName = current.CompanySelectionName;
const CompanyLookupResponse = current.CompanyLookupResponse;
const CompaniesResponse = current.CompaniesResponse;
const CompaniesSearchResponse = current.CompaniesSearchResponse;
const CompanyProfileResponse = current.CompanyProfileResponse;
const CompanyProfileExtendedResponse = current.CompanyProfileExtendedResponse;
const CompanyProfileResponseMixed = current.CompanyProfileResponseMixed;
const CompanyProfileExtended = current.CompanyProfileExtended;
const CompanyUpgrades = current.CompanyUpgrades;
const CompanyProfile = current.CompanyProfile;
const CompanySearchProfile = current.CompanySearchProfile;
const CompanyType = current.CompanyType;
const CompanyDirector = current.CompanyDirector;
const CompanyEmployees = current.CompanyEmployees;
const CompanyIncome = current.CompanyIncome;
const CompanyCustomers = current.CompanyCustomers;
const CompanyEmployeesResponse = current.CompanyEmployeesResponse;
const CompanyEmployeesResponseBasic = current.CompanyEmployeesResponseBasic;
const CompanyEmployeeExtended = current.CompanyEmployeeExtended;
const CompanyEmployeeFull = current.CompanyEmployeeFull;
const CompanyEmployeeStats = current.CompanyEmployeeStats;
const CompanyEmployeeEffectiveness = current.CompanyEmployeeEffectiveness;
const CompanyEmployee = current.CompanyEmployee;
const CompanyEmployeePosition = current.CompanyEmployeePosition;
const CompanyStockResponse = current.CompanyStockResponse;
const CompanyStockItem = current.CompanyStockItem;
const CompanyApplicationsResponse = current.CompanyApplicationsResponse;
const CompanyApplication = current.CompanyApplication;
const CompanyApplicationPlayer = current.CompanyApplicationPlayer;
const CompanyApplicationPlayerStats = current.CompanyApplicationPlayerStats;
const ForumCategoriesResponse = current.ForumCategoriesResponse;
const ForumThreadAuthor = current.ForumThreadAuthor;
const ForumPollVote = current.ForumPollVote;
const ForumPoll = current.ForumPoll;
const ForumThreadBase = current.ForumThreadBase;
const ForumThreadExtended = current.ForumThreadExtended;
const ForumPost = current.ForumPost;
const ForumThreadUserExtended = current.ForumThreadUserExtended;
const ForumSubscribedThreadPostsCount = current.ForumSubscribedThreadPostsCount;
const ForumSubscribedThread = current.ForumSubscribedThread;
const ForumFeed = current.ForumFeed;
const ForumThreadsResponse = current.ForumThreadsResponse;
const ForumThreadResponse = current.ForumThreadResponse;
const ForumPostsResponse = current.ForumPostsResponse;
const ForumSelectionName = current.ForumSelectionName;
const ForumLookupResponse = current.ForumLookupResponse;
const KeyLogResponse = current.KeyLogResponse;
const KeyInfoAvailableLog = current.KeyInfoAvailableLog;
const KeyInfoResponse = current.KeyInfoResponse;
const KeySelectionName = current.KeySelectionName;
const PointsMarketResponse = current.PointsMarketResponse;
const AuctionHouseStackableItem = current.AuctionHouseStackableItem;
const AuctionHouseListing = current.AuctionHouseListing;
const AuctionHouseListingResponse = current.AuctionHouseListingResponse;
const AuctionHouseResponse = current.AuctionHouseResponse;
const BasicProperty = current.BasicProperty;
const MarketRentalDetails = current.MarketRentalDetails;
const MarketRentalsResponse = current.MarketRentalsResponse;
const MarketPropertyDetails = current.MarketPropertyDetails;
const MarketPropertiesResponse = current.MarketPropertiesResponse;
const BazaarWeekly = current.BazaarWeekly;
const BazaarSpecialized = current.BazaarSpecialized;
const BazaarResponse = current.BazaarResponse;
const BazaarResponseSpecialized = current.BazaarResponseSpecialized;
const Bazaar = current.Bazaar;
const BazaarWeeklyCustomers = current.BazaarWeeklyCustomers;
const BazaarTotalFavorites = current.BazaarTotalFavorites;
const BazaarRecentFavorites = current.BazaarRecentFavorites;
const BazaarWeeklyIncome = current.BazaarWeeklyIncome;
const BazaarBulkSales = current.BazaarBulkSales;
const BazaarAdvancedItemSales = current.BazaarAdvancedItemSales;
const BazaarBargainSales = current.BazaarBargainSales;
const BazaarDollarSales = current.BazaarDollarSales;
const ItemMarketListingItemBonus = current.ItemMarketListingItemBonus;
const ItemMarketListingItemStats = current.ItemMarketListingItemStats;
const ItemMarketItem = current.ItemMarketItem;
const ItemMarketListingStackable = current.ItemMarketListingStackable;
const ItemMarketListingItemDetails = current.ItemMarketListingItemDetails;
const ItemMarketListingNonstackable = current.ItemMarketListingNonstackable;
const ItemMarket = current.ItemMarket;
const MarketItemMarketResponse = current.MarketItemMarketResponse;
const MarketSelectionName = current.MarketSelectionName;
const MarketLookupResponse = current.MarketLookupResponse;
const UserRacingRecordsResponse = current.UserRacingRecordsResponse;
const RacingCarsResponse = current.RacingCarsResponse;
const RaceCar = current.RaceCar;
const RacingTracksResponse = current.RacingTracksResponse;
const RaceTrack = current.RaceTrack;
const RacingCarUpgradesResponse = current.RacingCarUpgradesResponse;
const RaceCarUpgrade = current.RaceCarUpgrade;
const RacingRacesResponse = current.RacingRacesResponse;
const Race = current.Race;
const RacingTrackRecordsResponse = current.RacingTrackRecordsResponse;
const RaceRecord = current.RaceRecord;
const RacerDetails = current.RacerDetails;
const RacingRaceDetails = current.RacingRaceDetails;
const UserRaceDetails = current.UserRaceDetails;
const RacingRaceDetailsResponse = current.RacingRaceDetailsResponse;
const RacingSelectionName = current.RacingSelectionName;
const RacingLookupResponse = current.RacingLookupResponse;
const PropertySelectionName = current.PropertySelectionName;
const PropertyLookupResponse = current.PropertyLookupResponse;
const TornItemStat = current.TornItemStat;
const TornItemStats = current.TornItemStats;
const TornItemStatsResponse = current.TornItemStatsResponse;
const TornRockPaperScissorsResponse = current.TornRockPaperScissorsResponse;
const TornCityStatsResponse = current.TornCityStatsResponse;
const TornPokerTable = current.TornPokerTable;
const TornPokerTablesResponse = current.TornPokerTablesResponse;
const TornCard = current.TornCard;
const TornCardsResponse = current.TornCardsResponse;
const TornBank = current.TornBank;
const TornBankResponse = current.TornBankResponse;
const TornCityShopItem = current.TornCityShopItem;
const TornCityShop = current.TornCityShop;
const TornCityShopsResponse = current.TornCityShopsResponse;
const TornGymModifiers = current.TornGymModifiers;
const TornGym = current.TornGym;
const TornGymsResponse = current.TornGymsResponse;
const TornSearchForCash = current.TornSearchForCash;
const TornSearchForCashResponse = current.TornSearchForCashResponse;
const TornShopliftingSecurityStatus = current.TornShopliftingSecurityStatus;
const TornShoplifting = current.TornShoplifting;
const TornShopliftingResponse = current.TornShopliftingResponse;
const TornCompaniesResponse = current.TornCompaniesResponse;
const TornCompany = current.TornCompany;
const TornCompanyPosition = current.TornCompanyPosition;
const TornCompanySpecial = current.TornCompanySpecial;
const TornCompanyStock = current.TornCompanyStock;
const TornStock = current.TornStock;
const TornStockPerformance = current.TornStockPerformance;
const TornStockHistory = current.TornStockHistory;
const TornMuseumSet = current.TornMuseumSet;
const TornMuseumResponse = current.TornMuseumResponse;
const TornStockDetailed = current.TornStockDetailed;
const TornStocksResponse = current.TornStocksResponse;
const TornStockDetailedResponse = current.TornStockDetailedResponse;
const TornEliminationTeamCaptain = current.TornEliminationTeamCaptain;
const TornEliminationTeamAttacksSummary = current.TornEliminationTeamAttacksSummary;
const TornEliminationTeam = current.TornEliminationTeam;
const TornEliminationTeamsResponse = current.TornEliminationTeamsResponse;
const TornEliminationTeamPlayer = current.TornEliminationTeamPlayer;
const TornEliminationTeamPlayersResponse = current.TornEliminationTeamPlayersResponse;
const TornItemDetails = current.TornItemDetails;
const TornItemDetailsDeprecated = current.TornItemDetailsDeprecated;
const TornItemDetailsResponse = current.TornItemDetailsResponse;
const TornMerit = current.TornMerit;
const TornMeritsResponse = current.TornMeritsResponse;
const TornHonor = current.TornHonor;
const TornHonorsResponse = current.TornHonorsResponse;
const TornMedal = current.TornMedal;
const TornMedalsResponse = current.TornMedalsResponse;
const TornOrganizedCrimeResponse = current.TornOrganizedCrimeResponse;
const TornOrganizedCrime = current.TornOrganizedCrime;
const TornOrganizedCrimeSpawn = current.TornOrganizedCrimeSpawn;
const TornOrganizedCrimeScope = current.TornOrganizedCrimeScope;
const TornOrganizedCrimeSlot = current.TornOrganizedCrimeSlot;
const TornOrganizedCrimeRequiredItem = current.TornOrganizedCrimeRequiredItem;
const TornProperties = current.TornProperties;
const TornEducationRewards = current.TornEducationRewards;
const TornEducationPrerequisites = current.TornEducationPrerequisites;
const TornEducationCourses = current.TornEducationCourses;
const TornEducation = current.TornEducation;
const TornEducationResponse = current.TornEducationResponse;
const TornTerritoryCoordinates = current.TornTerritoryCoordinates;
const TornTerritory = current.TornTerritory;
const TornTerritoriesResponse = current.TornTerritoriesResponse;
const TornTerritoriesNoLinksResponse = current.TornTerritoriesNoLinksResponse;
const TornSubcrimesResponse = current.TornSubcrimesResponse;
const TornSubcrime = current.TornSubcrime;
const TornCrime = current.TornCrime;
const TornCrimesResponse = current.TornCrimesResponse;
const TornCalendarActivity = current.TornCalendarActivity;
const TornCalendarResponse = current.TornCalendarResponse;
const TornHofBasic = current.TornHofBasic;
const TornHofWithOffenses = current.TornHofWithOffenses;
const TornHof = current.TornHof;
const TornHofResponse = current.TornHofResponse;
const FactionHofValues = current.FactionHofValues;
const TornFactionHof = current.TornFactionHof;
const TornFactionHofResponse = current.TornFactionHofResponse;
const TornLog = current.TornLog;
const TornLogCategory = current.TornLogCategory;
const TornLogTypesResponse = current.TornLogTypesResponse;
const TornLogCategoriesResponse = current.TornLogCategoriesResponse;
const Bounty = current.Bounty;
const AttackLogSummary = current.AttackLogSummary;
const AttackLog = current.AttackLog;
const AttackLogResponse = current.AttackLogResponse;
const TornBountiesResponse = current.TornBountiesResponse;
const TornItemAmmo = current.TornItemAmmo;
const TornItemAmmoResponse = current.TornItemAmmoResponse;
const TornItemMods = current.TornItemMods;
const TornItemModsResponse = current.TornItemModsResponse;
const TornItemBaseStats = current.TornItemBaseStats;
const TornItemWeaponDetails = current.TornItemWeaponDetails;
const TornItemArmorCoverage = current.TornItemArmorCoverage;
const TornItemArmorDetails = current.TornItemArmorDetails;
const TornItemShop = current.TornItemShop;
const TornItem = current.TornItem;
const TornItemsResponse = current.TornItemsResponse;
const TornFactionTreeBranch = current.TornFactionTreeBranch;
const TornFactionTree = current.TornFactionTree;
const TornFactionTreeResponse = current.TornFactionTreeResponse;
const TornSelectionName = current.TornSelectionName;
const TornLookupResponse = current.TornLookupResponse;
const TornHalloweenUpgrade = current.TornHalloweenUpgrade;
const TornHalloween = current.TornHalloween;
const TornHalloweenResponse = current.TornHalloweenResponse;
pub const getMyAmmo = struct {
    pub const operation_id = "getMyAmmo";
    pub const path = "/user/ammo";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserAmmoResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your ammo information\",\"description\":\"Requires minimal key. <br>\",\"operationId\":\"getMyAmmo\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyMinimal\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserAmmoResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyAttacks = struct {
    pub const operation_id = "getMyAttacks";
    pub const path = "/user/attacks";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        filters: model.Presence([]const ApiFiltersAttacksRevivesEnum) = .absent,
        limit: model.Presence(i64) = .absent,
        sort: model.Presence(enum {
            DESC,
            ASC,
        }) = .absent,
        to: model.Presence(i64) = .absent,
        from: model.Presence(i64) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = AttacksResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your detailed attacks\",\"description\":\"Requires limited access key. <br>\",\"operationId\":\"getMyAttacks\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiFiltersIncomingOutgoing\"},{\"$ref\":\"#/components/parameters/ApiLimit100\"},{\"$ref\":\"#/components/parameters/ApiSort\"},{\"$ref\":\"#/components/parameters/ApiTo\"},{\"$ref\":\"#/components/parameters/ApiFrom\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyLimited\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/AttacksResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyAttacksSimplified = struct {
    pub const operation_id = "getMyAttacksSimplified";
    pub const path = "/user/attacksfull";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        filters: model.Presence([]const ApiFiltersAttacksRevivesEnum) = .absent,
        limit: model.Presence(i64) = .absent,
        sort: model.Presence(enum {
            DESC,
            ASC,
        }) = .absent,
        to: model.Presence(i64) = .absent,
        from: model.Presence(i64) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = AttacksFullResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your simplified attacks\",\"description\":\"Requires limited access key. <br>Returns up to 1,000 rows. <br>\",\"operationId\":\"getMyAttacksSimplified\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiFiltersIncomingOutgoing\"},{\"$ref\":\"#/components/parameters/ApiLimit1000\"},{\"$ref\":\"#/components/parameters/ApiSort\"},{\"$ref\":\"#/components/parameters/ApiTo\"},{\"$ref\":\"#/components/parameters/ApiFrom\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyLimited\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/AttacksFullResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyBars = struct {
    pub const operation_id = "getMyBars";
    pub const path = "/user/bars";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserBarsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your bars information\",\"description\":\"Requires minimal access key. <br>\",\"operationId\":\"getMyBars\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyMinimal\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserBarsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyBasicInformation = struct {
    pub const operation_id = "getMyBasicInformation";
    pub const path = "/user/basic";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        striptags: model.Presence(enum {
            true,
            false,
        }) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserBasicResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your basic profile information\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getMyBasicInformation\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiStripTagsTrue\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserBasicResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getUserBasicInformation = struct {
    pub const operation_id = "getUserBasicInformation";
    pub const path = "/user/{id}/basic";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        id: UserDiscordPathId,
        striptags: model.Presence(enum {
            true,
            false,
        }) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserBasicResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get basic profile information for a specific user\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getUserBasicInformation\",\"parameters\":[{\"name\":\"id\",\"in\":\"path\",\"description\":\"User id or user discord id\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/UserDiscordPathId\"}},{\"$ref\":\"#/components/parameters/ApiStripTagsTrue\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserBasicResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyBattlestats = struct {
    pub const operation_id = "getMyBattlestats";
    pub const path = "/user/battlestats";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserBattleStatsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your battlestats\",\"description\":\"Requires limited access key. <br>\",\"operationId\":\"getMyBattlestats\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyLimited\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserBattleStatsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyBounties = struct {
    pub const operation_id = "getMyBounties";
    pub const path = "/user/bounties";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserBountiesResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get bounties placed on you\",\"description\":\"<b>Globally cached selection.</b><br><br>Requires public access key. <br>\",\"operationId\":\"getMyBounties\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserBountiesResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getUserBounties = struct {
    pub const operation_id = "getUserBounties";
    pub const path = "/user/{id}/bounties";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        id: UserDiscordPathId,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserBountiesResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get bounties placed on a specific user\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getUserBounties\",\"parameters\":[{\"name\":\"id\",\"in\":\"path\",\"description\":\"User id or user discord id\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/UserDiscordPathId\"}},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserBountiesResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyCalendarTime = struct {
    pub const operation_id = "getMyCalendarTime";
    pub const path = "/user/calendar";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserCalendarResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your calendar events start time\",\"description\":\"Requires minimal access key. <br>Only available to yourself.\",\"operationId\":\"getMyCalendarTime\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyMinimal\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserCalendarResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyCasinoStreak = struct {
    pub const operation_id = "getMyCasinoStreak";
    pub const path = "/user/casino";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserCasinoResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your casino streak & tokens\",\"description\":\"Requires limited access key. <br>Only available to yourself.\",\"operationId\":\"getMyCasinoStreak\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyLimited\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserCasinoResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyCompetitionInfo = struct {
    pub const operation_id = "getMyCompetitionInfo";
    pub const path = "/user/competition";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserCompetitionResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your competition information\",\"description\":\"Requires public access key.\",\"operationId\":\"getMyCompetitionInfo\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserCompetitionResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getUserCompetitionInfo = struct {
    pub const operation_id = "getUserCompetitionInfo";
    pub const path = "/user/{id}/competition";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        id: UserDiscordPathId,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserCompetitionResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get competition information for a specific player\",\"description\":\"Requires public access key.\",\"operationId\":\"getUserCompetitionInfo\",\"parameters\":[{\"name\":\"id\",\"in\":\"path\",\"description\":\"User id or user discord id\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/UserDiscordPathId\"}},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserCompetitionResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyCooldowns = struct {
    pub const operation_id = "getMyCooldowns";
    pub const path = "/user/cooldowns";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserCooldownsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your cooldowns information\",\"description\":\"Requires minimal access key. <br>\",\"operationId\":\"getMyCooldowns\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyMinimal\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserCooldownsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyCrimes = struct {
    pub const operation_id = "getMyCrimes";
    pub const path = "/user/{crimeId}/crimes";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        crimeId: TornCrimeId,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserCrimesResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your crime statistics\",\"description\":\"Requires minimal access key. <br>Return the details and statistics about for a specific crime.\",\"operationId\":\"getMyCrimes\",\"parameters\":[{\"name\":\"crimeId\",\"in\":\"path\",\"description\":\"Crime id\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/TornCrimeId\"}},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyMinimal\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserCrimesResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyDiscord = struct {
    pub const operation_id = "getMyDiscord";
    pub const path = "/user/discord";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserDiscordResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your discord information\",\"description\":\"Requires public key. <br>\",\"operationId\":\"getMyDiscord\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserDiscordResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getUserDiscord = struct {
    pub const operation_id = "getUserDiscord";
    pub const path = "/user/{id}/discord";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        id: UserDiscordPathId,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserDiscordResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get discord information for a specific user\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getUserDiscord\",\"parameters\":[{\"name\":\"id\",\"in\":\"path\",\"description\":\"User id or user discord id\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/UserDiscordPathId\"}},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserDiscordResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyEducation = struct {
    pub const operation_id = "getMyEducation";
    pub const path = "/user/education";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserEducationResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your education information\",\"description\":\"Requires minimal access key. <br>The response contains a list of complete eduactions and of a current education (if any).\",\"operationId\":\"getMyEducation\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyMinimal\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserEducationResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyEnlistedCars = struct {
    pub const operation_id = "getMyEnlistedCars";
    pub const path = "/user/enlistedcars";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserEnlistedCarsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your enlisted cars\",\"description\":\"Requires minimal access key. <br>Returns a list of all user enlisted cars.\",\"operationId\":\"getMyEnlistedCars\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyMinimal\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserEnlistedCarsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyEquipment = struct {
    pub const operation_id = "getMyEquipment";
    pub const path = "/user/equipment";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserEquipmentResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your equipment & clothing\",\"description\":\"Requires minimal access key.\",\"operationId\":\"getMyEquipment\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyMinimal\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserEquipmentResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyEvents = struct {
    pub const operation_id = "getMyEvents";
    pub const path = "/user/events";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        striptags: model.Presence(enum {
            true,
            false,
        }) = .absent,
        limit: model.Presence(i64) = .absent,
        from: model.Presence(i64) = .absent,
        to: model.Presence(i64) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserEventsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your events\",\"description\":\"Requires limited access key. <br> Unfortunately, the 'sort' parameter is not available for this selection.\",\"operationId\":\"getMyEvents\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiStripTagsFalse\"},{\"$ref\":\"#/components/parameters/ApiLimit100Default20\"},{\"$ref\":\"#/components/parameters/ApiFrom\"},{\"$ref\":\"#/components/parameters/ApiTo\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyLimited\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserEventsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyFaction = struct {
    pub const operation_id = "getMyFaction";
    pub const path = "/user/faction";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserFactionResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your faction information\",\"description\":\"Requires public access key.\",\"operationId\":\"getMyFaction\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserFactionResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getUserFaction = struct {
    pub const operation_id = "getUserFaction";
    pub const path = "/user/{id}/faction";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        id: UserDiscordPathId,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserFactionResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get faction information for a specific player\",\"description\":\"Requires public access key.\",\"operationId\":\"getUserFaction\",\"parameters\":[{\"name\":\"id\",\"in\":\"path\",\"description\":\"User id or user discord id\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/UserDiscordPathId\"}},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserFactionResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyForumFeed = struct {
    pub const operation_id = "getMyForumFeed";
    pub const path = "/user/forumfeed";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserForumFeedResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get updates on your threads and posts\",\"description\":\"Requires minimal access key. <br>This selection returns data visible in 'Feed' section on forum page. Feed is sorted by timestamp descending. Only a maximum of 100 rows are returned.\",\"operationId\":\"getMyForumFeed\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyMinimal\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserForumFeedResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyForumFriendsUpdates = struct {
    pub const operation_id = "getMyForumFriendsUpdates";
    pub const path = "/user/forumfriends";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserForumFriendsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get updates on your friends' activity\",\"description\":\"Requires minimal access key. <br>This selection returns data visible in 'Friends' section on forum page. Feed is sorted by timestamp descending. Only a maximum of 100 rows are returned.\",\"operationId\":\"getMyForumFriendsUpdates\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyMinimal\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserForumFriendsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyForumPosts = struct {
    pub const operation_id = "getMyForumPosts";
    pub const path = "/user/forumposts";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        striptags: model.Presence(enum {
            true,
            false,
        }) = .absent,
        limit: model.Presence(i64) = .absent,
        sort: model.Presence(enum {
            DESC,
            ASC,
        }) = .absent,
        from: model.Presence(i64) = .absent,
        to: model.Presence(i64) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserForumPostsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your posts\",\"description\":\"Requires public access key. <br>Returns 20 posts per page.\",\"operationId\":\"getMyForumPosts\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiStripTagsTrue\"},{\"$ref\":\"#/components/parameters/ApiLimit20\"},{\"$ref\":\"#/components/parameters/ApiSort\"},{\"$ref\":\"#/components/parameters/ApiFrom\"},{\"$ref\":\"#/components/parameters/ApiTo\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserForumPostsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getUserForumPosts = struct {
    pub const operation_id = "getUserForumPosts";
    pub const path = "/user/{id}/forumposts";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        striptags: model.Presence(enum {
            true,
            false,
        }) = .absent,
        id: UserDiscordPathId,
        limit: model.Presence(i64) = .absent,
        sort: model.Presence(enum {
            DESC,
            ASC,
        }) = .absent,
        from: model.Presence(i64) = .absent,
        to: model.Presence(i64) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserForumPostsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get posts for a specific player\",\"description\":\"Requires public access key. <br>Returns 20 posts per page for a specific player.\",\"operationId\":\"getUserForumPosts\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiStripTagsTrue\"},{\"name\":\"id\",\"in\":\"path\",\"description\":\"User id or user discord id\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/UserDiscordPathId\"}},{\"$ref\":\"#/components/parameters/ApiLimit20\"},{\"$ref\":\"#/components/parameters/ApiSort\"},{\"$ref\":\"#/components/parameters/ApiFrom\"},{\"$ref\":\"#/components/parameters/ApiTo\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserForumPostsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyForumSubscribedThreads = struct {
    pub const operation_id = "getMyForumSubscribedThreads";
    pub const path = "/user/forumsubscribedthreads";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserForumSubscribedThreadsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get updates on threads you subscribed to\",\"description\":\"Requires minimal access key. <br>This selection returns data visible in 'Subscribed Threads' section on forum page. Threads are sorted in the same way as on site.\",\"operationId\":\"getMyForumSubscribedThreads\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyMinimal\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserForumSubscribedThreadsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyForumThreads = struct {
    pub const operation_id = "getMyForumThreads";
    pub const path = "/user/forumthreads";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        limit: model.Presence(i64) = .absent,
        sort: model.Presence(enum {
            DESC,
            ASC,
        }) = .absent,
        from: model.Presence(i64) = .absent,
        to: model.Presence(i64) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserForumThreadsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your threads\",\"description\":\"Requires public access key. <br>Returns 100 threads per page. The field 'new_posts' is also available, indicating the amount of unread posts with a Minimum API key (or higher).\",\"operationId\":\"getMyForumThreads\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiLimit100Default20\"},{\"$ref\":\"#/components/parameters/ApiSort\"},{\"$ref\":\"#/components/parameters/ApiFrom\"},{\"$ref\":\"#/components/parameters/ApiTo\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserForumThreadsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getUserForumThreads = struct {
    pub const operation_id = "getUserForumThreads";
    pub const path = "/user/{id}/forumthreads";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        id: UserDiscordPathId,
        limit: model.Presence(i64) = .absent,
        sort: model.Presence(enum {
            DESC,
            ASC,
        }) = .absent,
        from: model.Presence(i64) = .absent,
        to: model.Presence(i64) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserForumThreadsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get threads for a specific player\",\"description\":\"Requires public access key. <br>Returns 100 threads per page for a specific player. When requesting data for the key owner, a field 'new_posts' is also available, indicating the amount of unread posts. Minimum API key is required for that.\",\"operationId\":\"getUserForumThreads\",\"parameters\":[{\"name\":\"id\",\"in\":\"path\",\"description\":\"User id or user discord id\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/UserDiscordPathId\"}},{\"$ref\":\"#/components/parameters/ApiLimit100Default20\"},{\"$ref\":\"#/components/parameters/ApiSort\"},{\"$ref\":\"#/components/parameters/ApiFrom\"},{\"$ref\":\"#/components/parameters/ApiTo\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserForumThreadsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyGym = struct {
    pub const operation_id = "getMyGym";
    pub const path = "/user/gym";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserGymResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your currently active gym\",\"description\":\"Requires minimal access key. <br>\",\"operationId\":\"getMyGym\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserGymResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyHalloween = struct {
    pub const operation_id = "getMyHalloween";
    pub const path = "/user/halloween";
    pub const stability = "Untable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserHalloweenResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your Halloween treats information\",\"description\":\"Requires minimal access key. <br>Returns your current and cumulative treats and the IDs of basket upgrades you have unlocked.\",\"operationId\":\"getMyHalloween\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyMinimal\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserHalloweenResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Untable\"}";
};
pub const getMyHoF = struct {
    pub const operation_id = "getMyHoF";
    pub const path = "/user/hof";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserHofResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your hall of fame rankings\",\"description\":\"Requires public access key. <br>When requesting selection with Limited, Full or Custom key, battle_stats selection will be populated.\",\"operationId\":\"getMyHoF\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserHofResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getUserHoF = struct {
    pub const operation_id = "getUserHoF";
    pub const path = "/user/{id}/hof";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        id: UserDiscordPathId,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserHofResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get hall of fame rankings for a specific player\",\"description\":\"Requires public access key. <br>The battle_stats selection will be populated only when requesting selection with Limited, Full or Custom key and for yourself.\",\"operationId\":\"getUserHoF\",\"parameters\":[{\"name\":\"id\",\"in\":\"path\",\"description\":\"User id or user discord id\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/UserDiscordPathId\"}},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserHofResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyHonors = struct {
    pub const operation_id = "getMyHonors";
    pub const path = "/user/honors";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserHonorsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your achieved honors\",\"description\":\"Requires minimal access key. <br>\",\"operationId\":\"getMyHonors\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyMinimal\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserHonorsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyIcons = struct {
    pub const operation_id = "getMyIcons";
    pub const path = "/user/icons";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserIconsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your icons information\",\"description\":\"Requires public access key. <br> When requesting data for yourself with 'Limited' or 'Full' access keys, the response will be of type UserIconPrivate, otherwise UserIconPublic.\",\"operationId\":\"getMyIcons\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserIconsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getUserIcons = struct {
    pub const operation_id = "getUserIcons";
    pub const path = "/user/{id}/icons";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        id: UserDiscordPathId,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserIconsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get icons information for a specific player\",\"description\":\"Requires public access key.<br> When requesting data for yourself with 'Custom', 'Limited' or 'Full' access keys, the response will be of type UserIconPrivate, otherwise UserIconPublic.\",\"operationId\":\"getUserIcons\",\"parameters\":[{\"name\":\"id\",\"in\":\"path\",\"description\":\"User id or user discord id\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/UserDiscordPathId\"}},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserIconsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyInventory = struct {
    pub const operation_id = "getMyInventory";
    pub const path = "/user/inventory";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = 900;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        cat: model.Presence(TornInventoryItemType) = .absent,
        offset: model.Presence(i64) = .absent,
        limit: model.Presence(i64) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserInventoryResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your inventory\",\"description\":\"<b>Cached selection (15 minutes per category).</b><br><br>Requires minimal access key. <br>\",\"operationId\":\"getMyInventory\",\"parameters\":[{\"name\":\"cat\",\"in\":\"query\",\"description\":\"Items category\",\"required\":false,\"schema\":{\"$ref\":\"#/components/schemas/TornInventoryItemType\"}},{\"$ref\":\"#/components/parameters/ApiOffset\"},{\"$ref\":\"#/components/parameters/ApiLimit250Default20\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyMinimal\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserInventoryResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyItemMarketListings = struct {
    pub const operation_id = "getMyItemMarketListings";
    pub const path = "/user/itemmarket";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        offset: model.Presence(i64) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserItemMarketResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your item market listings\",\"description\":\"Requires limited access key. <br>\",\"operationId\":\"getMyItemMarketListings\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiOffset\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyLimited\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserItemMarketResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyItemModsInformation = struct {
    pub const operation_id = "getMyItemModsInformation";
    pub const path = "/user/itemmods";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserItemModsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your information about available item mods\",\"description\":\"Requires minimal access key. <br>\",\"operationId\":\"getMyItemModsInformation\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserItemModsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyJob = struct {
    pub const operation_id = "getMyJob";
    pub const path = "/user/job";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserJobResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your job information\",\"description\":\"Requires public access key.\",\"operationId\":\"getMyJob\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserJobResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getUserJob = struct {
    pub const operation_id = "getUserJob";
    pub const path = "/user/{id}/job";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        id: UserDiscordPathId,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserJobResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get job information for a specific player\",\"description\":\"Requires public access key.\",\"operationId\":\"getUserJob\",\"parameters\":[{\"name\":\"id\",\"in\":\"path\",\"description\":\"User id or user discord id\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/UserDiscordPathId\"}},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserJobResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyJobPoints = struct {
    pub const operation_id = "getMyJobPoints";
    pub const path = "/user/jobpoints";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserJobPointsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your jobpoints\",\"description\":\"Requires minimal access key. <br>\",\"operationId\":\"getMyJobPoints\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyMinimal\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserJobPointsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyJobRanks = struct {
    pub const operation_id = "getMyJobRanks";
    pub const path = "/user/jobranks";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserJobRanksResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your starter job positions\",\"description\":\"Requires minimal access key. <br>\",\"operationId\":\"getMyJobRanks\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyMinimal\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserJobRanksResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyContactsList = struct {
    pub const operation_id = "getMyContactsList";
    pub const path = "/user/list";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        cat: UserListEnum,
        striptags: model.Presence(enum {
            true,
            false,
        }) = .absent,
        limit: model.Presence(i64) = .absent,
        offset: model.Presence(i64) = .absent,
        sort: model.Presence(enum {
            DESC,
            ASC,
        }) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserListResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your friends, enemies or targets list\",\"description\":\"Requires limited access key. <br>\",\"operationId\":\"getMyContactsList\",\"parameters\":[{\"name\":\"cat\",\"in\":\"query\",\"description\":\"Select list type\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/UserListEnum\"}},{\"$ref\":\"#/components/parameters/ApiStripTagsTrue\"},{\"$ref\":\"#/components/parameters/ApiLimit50\"},{\"$ref\":\"#/components/parameters/ApiOffsetNoDefault\"},{\"$ref\":\"#/components/parameters/ApiSortAsc\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyLimited\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserListResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyLogs = struct {
    pub const operation_id = "getMyLogs";
    pub const path = "/user/log";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        log: model.Presence([]const LogId) = .absent,
        cat: model.Presence(LogCategoryId) = .absent,
        target: model.Presence(UserId) = .absent,
        limit: model.Presence(i64) = .absent,
        to: model.Presence(i64) = .absent,
        from: model.Presence(i64) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        nanostamp: model.Presence([]const u8) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserLogsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your logs\",\"description\":\"Requires full access key. <br> It's possible to pass a list of log ids or a log category id.<br>This selection is standalone and cannot be used together with other selections.\",\"operationId\":\"getMyLogs\",\"parameters\":[{\"name\":\"log\",\"in\":\"query\",\"description\":\"Log ids, comma separated, e.g. 105,4900,4905\",\"required\":false,\"style\":\"form\",\"explode\":false,\"schema\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/LogId\"}}},{\"name\":\"cat\",\"in\":\"query\",\"description\":\"Log category id\",\"required\":false,\"schema\":{\"$ref\":\"#/components/schemas/LogCategoryId\"}},{\"name\":\"target\",\"in\":\"query\",\"description\":\"Get logs where you interacted with a specific player by passing their player ID.\",\"required\":false,\"schema\":{\"$ref\":\"#/components/schemas/UserId\"}},{\"$ref\":\"#/components/parameters/ApiLimit100Default20\"},{\"$ref\":\"#/components/parameters/ApiTo\"},{\"$ref\":\"#/components/parameters/ApiFrom\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiNanostamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyFull\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserLogsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyMedals = struct {
    pub const operation_id = "getMyMedals";
    pub const path = "/user/medals";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserMedalsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get all your achieved medals\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getMyMedals\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserMedalsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getUserMedals = struct {
    pub const operation_id = "getUserMedals";
    pub const path = "/user/{id}/medals";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        id: UserDiscordPathId,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserMedalsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get medals achieved by a specific player\",\"description\":\"Requires public access key.<br>Returns only highest medal in each category (just like profiles on site).\",\"operationId\":\"getUserMedals\",\"parameters\":[{\"name\":\"id\",\"in\":\"path\",\"description\":\"User id or user discord id\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/UserDiscordPathId\"}},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserMedalsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyMerits = struct {
    pub const operation_id = "getMyMerits";
    pub const path = "/user/merits";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserMeritsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your merits\",\"description\":\"Requires minimal access key. <br>\",\"operationId\":\"getMyMerits\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyMinimal\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserMeritsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyMessages = struct {
    pub const operation_id = "getMyMessages";
    pub const path = "/user/messages";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        limit: model.Presence(i64) = .absent,
        from: model.Presence(i64) = .absent,
        to: model.Presence(i64) = .absent,
        sort: model.Presence(enum {
            DESC,
            ASC,
        }) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserMessagesResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your messages\",\"description\":\"Requires limited access key. <br>\",\"operationId\":\"getMyMessages\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiLimit100Default20\"},{\"$ref\":\"#/components/parameters/ApiFrom\"},{\"$ref\":\"#/components/parameters/ApiTo\"},{\"$ref\":\"#/components/parameters/ApiSort\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyLimited\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserMessagesResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyMissions = struct {
    pub const operation_id = "getMyMissions";
    pub const path = "/user/missions";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserMissionsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your current missions information\",\"description\":\"Requires minimal access key. <br>\",\"operationId\":\"getMyMissions\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyMinimal\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserMissionsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyMoney = struct {
    pub const operation_id = "getMyMoney";
    pub const path = "/user/money";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserMoneyResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your current wealth\",\"description\":\"Requires limited access key. <br>\",\"operationId\":\"getMyMoney\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyLimited\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserMoneyResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyNewEvents = struct {
    pub const operation_id = "getMyNewEvents";
    pub const path = "/user/newevents";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        striptags: model.Presence(enum {
            true,
            false,
        }) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserNewEventsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your unseen events\",\"description\":\"Requires limited access key. <br>\",\"operationId\":\"getMyNewEvents\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiStripTagsFalse\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyLimited\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserNewEventsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyNetworth = struct {
    pub const operation_id = "getMyNetworth";
    pub const path = "/user/networth";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserNetworthResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your networth\",\"description\":\"Requires limited access key. <br>\",\"operationId\":\"getMyNetworth\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyLimited\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserNetworthResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyNewMessages = struct {
    pub const operation_id = "getMyNewMessages";
    pub const path = "/user/newmessages";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserNewMessagesResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your unseen messages\",\"description\":\"Requires limited access key. <br>This selection is cached for 1 hour.\",\"operationId\":\"getMyNewMessages\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyLimited\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserNewMessagesResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyNotifications = struct {
    pub const operation_id = "getMyNotifications";
    pub const path = "/user/notifications";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserNotificationsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your notifications\",\"description\":\"Requires minimal access key. <br>\",\"operationId\":\"getMyNotifications\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyMinimal\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserNotificationsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyOrganizedCrime = struct {
    pub const operation_id = "getMyOrganizedCrime";
    pub const path = "/user/organizedcrime";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserOrganizedCrimeResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your current ongoing organized crime\",\"description\":\"Requires minimal access key. <br>\",\"operationId\":\"getMyOrganizedCrime\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyMinimal\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserOrganizedCrimeResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyAvailableOrganizedCrimes = struct {
    pub const operation_id = "getMyAvailableOrganizedCrimes";
    pub const path = "/user/organizedcrimes";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserOrganizedCrimesResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your available slots for organized crimes with status 'Recruiting'\",\"description\":\"Requires minimal access key. <br>Unlike 'faction' -> 'crimes', this selection only shows empty slots, and only for crimes with the 'Recruiting' status.\",\"operationId\":\"getMyAvailableOrganizedCrimes\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyMinimal\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserOrganizedCrimesResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyPerks = struct {
    pub const operation_id = "getMyPerks";
    pub const path = "/user/perks";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserPerksResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your current perks\",\"description\":\"Requires minimal access key. <br>\",\"operationId\":\"getMyPerks\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserPerksResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyPersonalStats = struct {
    pub const operation_id = "getMyPersonalStats";
    pub const path = "/user/personalstats";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        cat: model.Presence(PersonalStatsCategoryEnum) = .absent,
        stat: model.Presence([]const PersonalStatsStatName) = .absent,
        timestamp: model.Presence(i64) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserPersonalStatsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your personal stats\",\"description\":\"Requires public access key. <br>\\n * UserPersonalStatsFull is returned only when this selection is requested with Limited, Full or Custom key access key.\\n * UserPersonalStatsFullPublic is returned when the requested category is 'all'.\\n * UserPersonalStatsPopular is returned when the requested category is 'popular'. Please try to use UserPersonalStatsPopular over UserPersonalStatsFullPublic wherever possible in order to reduce the server load.\\n * Otherwise, UserPersonalStatsCategory is returned for the matched category.\\n * Historical stats can be fetched via 'stat' query parameter. It's only possible to pass up to 10 historical stats at once (the rest is trimmed). When requesting historical stats the response will be of type UserPersonalStatsHistoric.\\n * Use 'timestamp' query parameter to get historical stats at the certain point in time. It's possible some historical stats didn't exist at the given timestamp, and for such stats you will not receive anything back.\",\"operationId\":\"getMyPersonalStats\",\"parameters\":[{\"name\":\"cat\",\"in\":\"query\",\"description\":\"Stats category. Required unless requesting specific stats via 'stat' query parameter\",\"required\":false,\"schema\":{\"$ref\":\"#/components/schemas/PersonalStatsCategoryEnum\"}},{\"name\":\"stat\",\"in\":\"query\",\"description\":\"Stat names (10 maximum). Used to fetch historical stat values\",\"required\":false,\"style\":\"form\",\"explode\":false,\"schema\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/PersonalStatsStatName\"}}},{\"name\":\"timestamp\",\"in\":\"query\",\"description\":\"Returns stats until this timestamp (converted to nearest date).\",\"required\":false,\"schema\":{\"type\":\"integer\",\"format\":\"int32\"}},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserPersonalStatsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getUserPersonalStats = struct {
    pub const operation_id = "getUserPersonalStats";
    pub const path = "/user/{id}/personalstats";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        id: UserDiscordPathId,
        cat: model.Presence(PersonalStatsCategoryEnum) = .absent,
        stat: model.Presence([]const PersonalStatsStatName) = .absent,
        timestamp: model.Presence(i64) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserPersonalStatsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get a player's personal stats\",\"description\":\"Requires public access key. <br>\\n *  UserPersonalStatsFull is returned only when this selection is requested for the key owner with Limited, Full or Custom key.\\n *  UserPersonalStatsFullPublic is returned when the requested category is 'all'.\\n *  UserPersonalStatsPopular is returned when the requested category is 'popular'. Please try to use UserPersonalStatsPopular over UserPersonalStatsFullPublic wherever possible in order to reduce the server load.\\n *  Otherwise, UserPersonalStatsCategory is returned for the matched category.\\n *  It's possible to request specific stats via 'stat' parameter. In this case the response will vary depending on the stats requested. Private stats are still available only to the key owner (with Limited or higher key).\\n *  Additionally, historical stats can also be fetched via 'stat' query parameter, but 'timestamp' parameter must be provided as well. It's only possible to pass up to 10 historical stats at once (the rest is trimmed). When requesting historical stats the response will be of type UserPersonalStatsHistoric.\",\"operationId\":\"getUserPersonalStats\",\"parameters\":[{\"name\":\"id\",\"in\":\"path\",\"description\":\"User id or user discord id\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/UserDiscordPathId\"}},{\"name\":\"cat\",\"in\":\"query\",\"description\":\"\",\"required\":false,\"schema\":{\"$ref\":\"#/components/schemas/PersonalStatsCategoryEnum\"}},{\"name\":\"stat\",\"in\":\"query\",\"description\":\"Stat names (10 maximum). Used to fetch historical stat values\",\"required\":false,\"style\":\"form\",\"explode\":false,\"schema\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/PersonalStatsStatName\"}}},{\"name\":\"timestamp\",\"in\":\"query\",\"description\":\"Returns stats until this timestamp (converted to nearest date).\",\"required\":false,\"schema\":{\"type\":\"integer\",\"format\":\"int32\"}},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserPersonalStatsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyProfile = struct {
    pub const operation_id = "getMyProfile";
    pub const path = "/user/profile";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        striptags: model.Presence(enum {
            true,
            false,
        }) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserProfileResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your own profile\",\"description\":\"Requires public access key.\",\"operationId\":\"getMyProfile\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiStripTagsTrue\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserProfileResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getUserProfile = struct {
    pub const operation_id = "getUserProfile";
    pub const path = "/user/{id}/profile";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        id: UserDiscordPathId,
        striptags: model.Presence(enum {
            true,
            false,
        }) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserProfileResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get profile information for a specific player\",\"description\":\"Requires public access key.\",\"operationId\":\"getUserProfile\",\"parameters\":[{\"name\":\"id\",\"in\":\"path\",\"description\":\"User id or user discord id\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/UserDiscordPathId\"}},{\"$ref\":\"#/components/parameters/ApiStripTagsTrue\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserProfileResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyProperties = struct {
    pub const operation_id = "getMyProperties";
    pub const path = "/user/properties";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        filters: model.Presence(enum {
            ownedByUser,
            ownedBySpouse,
        }) = .absent,
        offset: model.Presence(i64) = .absent,
        limit: model.Presence(i64) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserPropertiesResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your own properties\",\"description\":\"Requires public access key. <br>Extended responses are available when requesting the data with Limited or higher access keys.\",\"operationId\":\"getMyProperties\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiFiltersUserProperties\"},{\"$ref\":\"#/components/parameters/ApiOffset\"},{\"$ref\":\"#/components/parameters/ApiLimit100Default20\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserPropertiesResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getUserProperties = struct {
    pub const operation_id = "getUserProperties";
    pub const path = "/user/{id}/properties";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        id: UserDiscordPathId,
        filters: model.Presence(enum {
            ownedByUser,
            ownedBySpouse,
        }) = .absent,
        offset: model.Presence(i64) = .absent,
        limit: model.Presence(i64) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserPropertiesResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get specific user's properties\",\"description\":\"Requires public access key. <br>Extended responses are available when requesting the data with Limited or higher access keys for yourself or your spouse.\",\"operationId\":\"getUserProperties\",\"parameters\":[{\"name\":\"id\",\"in\":\"path\",\"description\":\"User id or user discord id\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/UserDiscordPathId\"}},{\"$ref\":\"#/components/parameters/ApiFiltersUserProperties\"},{\"$ref\":\"#/components/parameters/ApiOffset\"},{\"$ref\":\"#/components/parameters/ApiLimit100Default20\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserPropertiesResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyProperty = struct {
    pub const operation_id = "getMyProperty";
    pub const path = "/user/property";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserPropertyResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your current property\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getMyProperty\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserPropertyResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getUserProperty = struct {
    pub const operation_id = "getUserProperty";
    pub const path = "/user/{id}/property";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        id: UserDiscordPathId,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserPropertyResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get specific user's property\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getUserProperty\",\"parameters\":[{\"name\":\"id\",\"in\":\"path\",\"description\":\"User id or user discord id\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/UserDiscordPathId\"}},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserPropertyResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyRaces = struct {
    pub const operation_id = "getMyRaces";
    pub const path = "/user/races";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        limit: model.Presence(i64) = .absent,
        sort: model.Presence(enum {
            DESC,
            ASC,
        }) = .absent,
        from: model.Presence(i64) = .absent,
        to: model.Presence(i64) = .absent,
        cat: model.Presence(RacingRaceTypeEnum) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserRacesResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your races\",\"description\":\"Requires minimal access key. <br>Returns a list of user races, ordered by race start timestamp.\",\"operationId\":\"getMyRaces\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiLimit100Default20\"},{\"$ref\":\"#/components/parameters/ApiSort\"},{\"$ref\":\"#/components/parameters/ApiFrom\"},{\"$ref\":\"#/components/parameters/ApiTo\"},{\"name\":\"cat\",\"in\":\"query\",\"description\":\"Category of races returned\",\"required\":false,\"schema\":{\"$ref\":\"#/components/schemas/RacingRaceTypeEnum\"}},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyMinimal\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserRacesResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyRacingRecords = struct {
    pub const operation_id = "getMyRacingRecords";
    pub const path = "/user/racingrecords";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserRacingRecordsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your current racing records\",\"description\":\"Requires minimal access key. <br>\",\"operationId\":\"getMyRacingRecords\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyMinimal\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserRacingRecordsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyRefills = struct {
    pub const operation_id = "getMyRefills";
    pub const path = "/user/refills";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserRefillsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your refills information\",\"description\":\"Requires minimal access key. <br>\",\"operationId\":\"getMyRefills\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyMinimal\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserRefillsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyReports = struct {
    pub const operation_id = "getMyReports";
    pub const path = "/user/reports";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        cat: model.Presence(ReportTypeEnum) = .absent,
        target: model.Presence(UserId) = .absent,
        limit: model.Presence(i64) = .absent,
        offset: model.Presence(i64) = .absent,
        sort: model.Presence(enum {
            DESC,
            ASC,
        }) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = ReportsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your reports\",\"description\":\"Requires limited access key. <br>\\nThe limit is set to 25 when requesting any category other than 'stats'.<br>\\nWhen requesting the 'stats' category, limit can be increased up to 100.\",\"operationId\":\"getMyReports\",\"parameters\":[{\"name\":\"cat\",\"in\":\"query\",\"description\":\"Used to filter reports with a specific type.\",\"required\":false,\"schema\":{\"$ref\":\"#/components/schemas/ReportTypeEnum\"}},{\"name\":\"target\",\"in\":\"query\",\"description\":\"Get reports for a specific player by passing their player ID.\",\"required\":false,\"schema\":{\"$ref\":\"#/components/schemas/UserId\"}},{\"$ref\":\"#/components/parameters/ApiLimit100Default20\"},{\"$ref\":\"#/components/parameters/ApiOffset\"},{\"$ref\":\"#/components/parameters/ApiSortDesc\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyLimited\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/ReportsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyRevives = struct {
    pub const operation_id = "getMyRevives";
    pub const path = "/user/revives";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        filters: model.Presence([]const ApiFiltersAttacksRevivesEnum) = .absent,
        limit: model.Presence(i64) = .absent,
        sort: model.Presence(enum {
            DESC,
            ASC,
        }) = .absent,
        to: model.Presence(i64) = .absent,
        from: model.Presence(i64) = .absent,
        striptags: model.Presence(enum {
            true,
            false,
        }) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = RevivesResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your detailed revives\",\"description\":\"Requires limited access key. <br>\",\"operationId\":\"getMyRevives\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiFiltersIncomingOutgoing\"},{\"$ref\":\"#/components/parameters/ApiLimit100Default20\"},{\"$ref\":\"#/components/parameters/ApiSort\"},{\"$ref\":\"#/components/parameters/ApiTo\"},{\"$ref\":\"#/components/parameters/ApiFrom\"},{\"$ref\":\"#/components/parameters/ApiStripTagsTrue\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyLimited\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/RevivesResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyRevivesSimplified = struct {
    pub const operation_id = "getMyRevivesSimplified";
    pub const path = "/user/revivesFull";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        filters: model.Presence([]const ApiFiltersAttacksRevivesEnum) = .absent,
        limit: model.Presence(i64) = .absent,
        sort: model.Presence(enum {
            DESC,
            ASC,
        }) = .absent,
        to: model.Presence(i64) = .absent,
        from: model.Presence(i64) = .absent,
        striptags: model.Presence(enum {
            true,
            false,
        }) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = RevivesFullResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your simplified revives\",\"description\":\"Requires limited access key. <br>\",\"operationId\":\"getMyRevivesSimplified\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiFiltersIncomingOutgoing\"},{\"$ref\":\"#/components/parameters/ApiLimit1000Default20\"},{\"$ref\":\"#/components/parameters/ApiSort\"},{\"$ref\":\"#/components/parameters/ApiTo\"},{\"$ref\":\"#/components/parameters/ApiFrom\"},{\"$ref\":\"#/components/parameters/ApiStripTagsTrue\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyLimited\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/RevivesFullResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMySkills = struct {
    pub const operation_id = "getMySkills";
    pub const path = "/user/skills";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserSkillsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your skills\",\"description\":\"Requires minimal access key. <br>\",\"operationId\":\"getMySkills\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyMinimal\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserSkillsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getUsersSearch = struct {
    pub const operation_id = "getUsersSearch";
    pub const path = "/user/search";
    pub const stability = "Unstable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        name: model.Presence([]const u8) = .absent,
        filters: model.Presence([]const union(enum) {
            v0: enum {
                married,
                notMarried,
                traveling,
                notTraveling,
                inFaction,
                notInFaction,
                inCompany,
                notInCompany,
                inHospital,
                notInHospital,
                inJail,
                notInJail,
                inFederalJail,
                notInFederalJail,
                male,
                female,
                enby,
                lastActionNow,
                lastActionRecent,
                lastActionHourAgo,
                lastActionDayAgo,
                lastActionWeekAgo,
                lastActionMonthAgo,
                lastActionYearAgo,
            },
            v1: []const u8,
            v2: []const u8,
        }) = .absent,
        offset: model.Presence(i64) = .absent,
        sort: model.Presence(enum {
            DESC,
            ASC,
        }) = .absent,
        cursor: model.Presence([]const u8) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserSearchResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Search users by name or other criteria\",\"description\":\"Requires public access key. <br>This selection is standalone and cannot be used together with other selections.<br>It's always limited to return just 25 records.\",\"operationId\":\"getUsersSearch\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiName\"},{\"$ref\":\"#/components/parameters/ApiUserSearchFilter\"},{\"$ref\":\"#/components/parameters/ApiOffset\"},{\"$ref\":\"#/components/parameters/ApiSort\"},{\"$ref\":\"#/components/parameters/ApiCursor\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserSearchResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Unstable\"}";
};
pub const getUsersSnapshot = struct {
    pub const operation_id = "getUsersSnapshot";
    pub const path = "/user/snapshot";
    pub const stability = "Unstable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = []const u8;
    pub const media_type = "text/csv";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get daily active players snapshot CSV\",\"description\":\"Requires public access key.<br>Returns a CSV daily snapshot of active players.<br>This selection is standalone and cannot be used together with other selections.<br>\\nCSV columns: id, name, gender, signed_up, level, rank, donator, faction, company, job, spouse, display_case, bazaar, fed, fed_reason, time_played, awards\",\"operationId\":\"getUsersSnapshot\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestampSpecificPointInTime\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful CSV response\",\"content\":{\"text/csv\":{\"schema\":{\"type\":\"string\",\"example\":\"id,name,gender,signed_up,level,rank,donator,faction,company,job,spouse,display_case,bazaar,fed,fed_reason,time_played,awards\\\\n33,1,Chedburn,Male,1100521336,15,Outstanding,1,40992,79286,,2103253,1,1,0,,48076299,1388\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Unstable\"}";
};
pub const getMyStocks = struct {
    pub const operation_id = "getMyStocks";
    pub const path = "/user/stocks";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserStocksResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your stocks\",\"description\":\"Requires limited access key. <br>\",\"operationId\":\"getMyStocks\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyLimited\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserStocksResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyTrades = struct {
    pub const operation_id = "getMyTrades";
    pub const path = "/user/trades";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        cat: model.Presence(TradeCategoryEnum) = .absent,
        limit: model.Presence(i64) = .absent,
        sort: model.Presence(enum {
            DESC,
            ASC,
        }) = .absent,
        to: model.Presence(i64) = .absent,
        from: model.Presence(i64) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserTradesResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your trades\",\"description\":\"Requires limited access key. <br> When requesting 'ongoing' trades (default), limit/offset/sort are not being used.\",\"operationId\":\"getMyTrades\",\"parameters\":[{\"name\":\"cat\",\"in\":\"query\",\"description\":\"Category of trades returned\",\"required\":false,\"schema\":{\"$ref\":\"#/components/schemas/TradeCategoryEnum\"}},{\"$ref\":\"#/components/parameters/ApiLimit100\"},{\"$ref\":\"#/components/parameters/ApiSortDesc\"},{\"$ref\":\"#/components/parameters/ApiTo\"},{\"$ref\":\"#/components/parameters/ApiFrom\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyLimited\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserTradesResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyDetailedTrade = struct {
    pub const operation_id = "getMyDetailedTrade";
    pub const path = "/user/{tradeId}/trade";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        tradeId: TradeId,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserTradeResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your detailed trade\",\"description\":\"Requires limited access key. <br>Only possible to get trades you participated in.\",\"operationId\":\"getMyDetailedTrade\",\"parameters\":[{\"name\":\"tradeId\",\"in\":\"path\",\"description\":\"Trade id\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/TradeId\"}},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyLimited\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserTradeResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyTravelInformation = struct {
    pub const operation_id = "getMyTravelInformation";
    pub const path = "/user/travel";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserTravelResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your travel information\",\"description\":\"Requires minimal access key. <br>\",\"operationId\":\"getMyTravelInformation\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyMinimal\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserTravelResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyVirusCodingInformation = struct {
    pub const operation_id = "getMyVirusCodingInformation";
    pub const path = "/user/virus";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserVirusResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your virus coding information\",\"description\":\"Requires minimal access key. <br>\",\"operationId\":\"getMyVirusCodingInformation\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyMinimal\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserVirusResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyWeaponExp = struct {
    pub const operation_id = "getMyWeaponExp";
    pub const path = "/user/weaponexp";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserWeaponExpResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your weapon experience information\",\"description\":\"Requires minimal key. <br>\",\"operationId\":\"getMyWeaponExp\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyMinimal\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserWeaponExpResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyWorkstats = struct {
    pub const operation_id = "getMyWorkstats";
    pub const path = "/user/workstats";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserWorkStatsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get your working stats\",\"description\":\"Requires minimal access key. <br>\",\"operationId\":\"getMyWorkstats\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyMinimal\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserWorkStatsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getUserLookup = struct {
    pub const operation_id = "getUserLookup";
    pub const path = "/user/lookup";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = UserLookupResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get all available user selections\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getUserLookup\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/UserLookupResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getUserTimestamp = struct {
    pub const operation_id = "getUserTimestamp";
    pub const path = "/user/timestamp";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = TimestampResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get current server time\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getUserTimestamp\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/TimestampResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getUserGeneric = struct {
    pub const operation_id = "getUserGeneric";
    pub const path = "/user";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        selections: model.Presence([]const UserSelectionName) = .absent,
        id: model.Presence(union(enum) {
            v0: UserDiscordPathId,
            v1: TornCrimeId,
            v2: TradeId,
            v3: []const u8,
        }) = .absent,
        legacy: model.Presence([]const UserSelectionName) = .absent,
        limit: model.Presence(i64) = .absent,
        from: model.Presence(i64) = .absent,
        to: model.Presence(i64) = .absent,
        sort: model.Presence(enum {
            DESC,
            ASC,
        }) = .absent,
        cat: model.Presence(union(enum) {
            v0: ReportTypeEnum,
            v1: UserListEnum,
            v2: PersonalStatsCategoryEnum,
            v3: RacingRaceTypeEnum,
            v4: TornInventoryItemType,
            v5: TradeCategoryEnum,
        }) = .absent,
        stat: model.Presence([]const PersonalStatsStatName) = .absent,
        filters: model.Presence(enum {
            incoming,
            outgoing,
            ownedByUser,
            ownedBySpouse,
        }) = .absent,
        striptags: model.Presence(enum {
            true,
            false,
        }) = .absent,
        offset: model.Presence(i64) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = struct {
        crimes: model.Presence(UserCrime) = .absent,
        weaponexp: model.Presence([]const UserWeaponExp) = .absent,
        ammo: model.Presence([]const UserAmmo) = .absent,
        discord: model.Presence(struct {
            discord_id: DiscordId,
            user_id: UserId,
            pub const json_schema = "{\"required\":[\"discord_id\",\"user_id\"],\"properties\":{\"discord_id\":{\"$ref\":\"#/components/schemas/DiscordId\"},\"user_id\":{\"$ref\":\"#/components/schemas/UserId\"}},\"type\":\"object\"}";
        }) = .absent,
        races: model.Presence([]const UserRaceDetails) = .absent,
        _metadata: model.Presence(union(enum) {
            v0: RequestMetadataWithLinks,
            v1: RequestMetadataWithLinksAndTotal,
        }) = .absent,
        enlistedcars: model.Presence([]const UserRaceCarDetails) = .absent,
        forumPosts: model.Presence([]const ForumPost) = .absent,
        forumThreads: model.Presence([]const ForumThreadUserExtended) = .absent,
        forumSubscribedThreads: model.Presence([]const ForumSubscribedThread) = .absent,
        forumFeed: model.Presence([]const ForumFeed) = .absent,
        forumFriends: model.Presence([]const ForumFeed) = .absent,
        property: model.Presence(UserPropertyDetails) = .absent,
        reports: model.Presence([]const Report) = .absent,
        hof: model.Presence(UserHofStats) = .absent,
        calendar: model.Presence(UserCalendar) = .absent,
        racingrecords: model.Presence([]const struct {
            track: struct {
                id: RaceTrackId,
                name: []const u8,
                pub const json_schema = "{\"required\":[\"id\",\"name\"],\"properties\":{\"id\":{\"$ref\":\"#/components/schemas/RaceTrackId\"},\"name\":{\"type\":\"string\"}},\"type\":\"object\"}";
            },
            records: []const struct {
                car_id: ItemId,
                car_name: []const u8,
                lap_time: i64,
                pub const json_schema = "{\"required\":[\"car_id\",\"car_name\",\"lap_time\"],\"properties\":{\"car_id\":{\"$ref\":\"#/components/schemas/ItemId\"},\"car_name\":{\"type\":\"string\"},\"lap_time\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
            },
            pub const json_schema = "{\"required\":[\"track\",\"records\"],\"properties\":{\"track\":{\"required\":[\"id\",\"name\"],\"properties\":{\"id\":{\"$ref\":\"#/components/schemas/RaceTrackId\"},\"name\":{\"type\":\"string\"}},\"type\":\"object\"},\"records\":{\"type\":\"array\",\"items\":{\"required\":[\"car_id\",\"car_name\",\"lap_time\"],\"properties\":{\"car_id\":{\"$ref\":\"#/components/schemas/ItemId\"},\"car_name\":{\"type\":\"string\"},\"lap_time\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}}},\"type\":\"object\"}";
        }) = .absent,
        education: model.Presence(UserEducation) = .absent,
        stocks: model.Presence([]const UserStock) = .absent,
        bounties: model.Presence([]const Bounty) = .absent,
        bounties_timestamp: model.Presence(i64) = .absent,
        bounties_delay: model.Presence(i64) = .absent,
        jobranks: model.Presence(UserJobRanks) = .absent,
        properties: model.Presence([]const union(enum) {
            v0: UserPropertyBasicDetails,
            v1: UserPropertyDetailsExtended,
            v2: UserPropertyDetailsExtendedRented,
            v3: UserPropertyDetailsExtendedForRent,
            v4: UserPropertyDetailsExtendedForSale,
        }) = .absent,
        factionBalance: model.Presence(?UserFactionBalance) = .absent,
        profile: model.Presence(union(enum) {
            v0: UserBasic,
            v1: struct {
                id: UserId,
                name: []const u8,
                level: i64,
                rank: union(enum) {
                    v0: UserRankEnum,
                    v1: []const u8,
                },
                title: union(enum) {
                    v0: UserTitleEnum,
                    v1: []const u8,
                },
                donator_status: ?UserDonatorStatusEnum,
                age: i64,
                signed_up: i64,
                faction_id: ?FactionId,
                honor_id: HonorId,
                revive_setting: ReviveSetting,
                property: struct {
                    id: PropertyId,
                    name: []const u8,
                    pub const json_schema = "{\"required\":[\"id\",\"name\"],\"properties\":{\"id\":{\"$ref\":\"#/components/schemas/PropertyId\"},\"name\":{\"type\":\"string\"}},\"type\":\"object\"}";
                },
                image: ?[]const u8,
                gender: UserGenderEnum,
                revivable: bool,
                role: UserRoleEnum,
                status: UserStatus,
                spouse: ?ProfileSpouse,
                awards: i64,
                friends: i64,
                enemies: i64,
                forum_posts: i64,
                karma: i64,
                last_action: UserLastAction,
                life: struct {
                    current: i64,
                    maximum: i64,
                    pub const json_schema = "{\"required\":[\"current\",\"maximum\"],\"properties\":{\"current\":{\"type\":\"integer\",\"format\":\"int32\"},\"maximum\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                },
                pub const json_schema = "{\"required\":[\"id\",\"name\",\"level\",\"rank\",\"title\",\"age\",\"signed_up\",\"faction_id\",\"honor_id\",\"property\",\"image\",\"gender\",\"revivable\",\"role\",\"status\",\"spouse\",\"awards\",\"friends\",\"enemies\",\"forum_posts\",\"karma\",\"last_action\",\"life\",\"donator_status\",\"revive_setting\"],\"properties\":{\"id\":{\"$ref\":\"#/components/schemas/UserId\"},\"name\":{\"type\":\"string\"},\"level\":{\"type\":\"integer\",\"format\":\"int32\"},\"rank\":{\"oneOf\":[{\"$ref\":\"#/components/schemas/UserRankEnum\"},{\"type\":\"string\"}]},\"title\":{\"oneOf\":[{\"$ref\":\"#/components/schemas/UserTitleEnum\"},{\"type\":\"string\"}]},\"donator_status\":{\"oneOf\":[{\"$ref\":\"#/components/schemas/UserDonatorStatusEnum\"},{\"type\":\"null\"}]},\"age\":{\"description\":\"Age in days.\",\"type\":\"integer\",\"format\":\"int32\"},\"signed_up\":{\"type\":\"integer\",\"format\":\"int32\"},\"faction_id\":{\"oneOf\":[{\"$ref\":\"#/components/schemas/FactionId\"},{\"type\":\"null\"}]},\"honor_id\":{\"$ref\":\"#/components/schemas/HonorId\"},\"revive_setting\":{\"$ref\":\"#/components/schemas/ReviveSetting\",\"description\":\"This field is shown only for 'Limited' or 'Full' access keys and only for the key owner, otherwise, the status is 'Unknown'.\"},\"property\":{\"required\":[\"id\",\"name\"],\"properties\":{\"id\":{\"$ref\":\"#/components/schemas/PropertyId\"},\"name\":{\"type\":\"string\"}},\"type\":\"object\"},\"image\":{\"oneOf\":[{\"type\":\"string\"},{\"type\":\"null\"}]},\"gender\":{\"$ref\":\"#/components/schemas/UserGenderEnum\"},\"revivable\":{\"type\":\"boolean\"},\"role\":{\"$ref\":\"#/components/schemas/UserRoleEnum\"},\"status\":{\"$ref\":\"#/components/schemas/UserStatus\"},\"spouse\":{\"oneOf\":[{\"$ref\":\"#/components/schemas/ProfileSpouse\"},{\"type\":\"null\"}]},\"awards\":{\"type\":\"integer\",\"format\":\"int32\"},\"friends\":{\"type\":\"integer\",\"format\":\"int32\"},\"enemies\":{\"type\":\"integer\",\"format\":\"int32\"},\"forum_posts\":{\"type\":\"integer\",\"format\":\"int32\"},\"karma\":{\"type\":\"integer\",\"format\":\"int32\"},\"last_action\":{\"$ref\":\"#/components/schemas/UserLastAction\"},\"life\":{\"required\":[\"current\",\"maximum\"],\"properties\":{\"current\":{\"type\":\"integer\",\"format\":\"int32\"},\"maximum\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}},\"type\":\"object\"}";
            },
        }) = .absent,
        revives: model.Presence(union(enum) {
            v0: []const Revive,
            v1: []const ReviveSimplified,
        }) = .absent,
        honors: model.Presence([]const UserHonor) = .absent,
        medals: model.Presence([]const UserMedal) = .absent,
        merits: model.Presence(UserMerits) = .absent,
        job: model.Presence(union(enum) {
            v0: UserJob,
            v1: UserCompany,
            v2: void,
        }) = .absent,
        faction: model.Presence(?UserFaction) = .absent,
        competition: model.Presence(union(enum) {
            v0: UserCompetitionHalloween,
            v1: UserCompetitionEasterEggs,
            v2: UserCompetitionRps,
            v3: UserCompetitionElimination,
        }) = .absent,
        icons: model.Presence(union(enum) {
            v0: []const UserIconPrivate,
            v1: []const UserIconPublic,
        }) = .absent,
        itemmarket: model.Presence([]const UserItemMarketListing) = .absent,
        list: model.Presence([]const UserList) = .absent,
        equipment: model.Presence([]const UserEquipment) = .absent,
        clothing: model.Presence([]const UserClothing) = .absent,
        missions: model.Presence(struct {
            credits: i64,
            givers: []const struct {
                id: UserId,
                name: []const u8,
                contracts: []const struct {
                    title: []const u8,
                    difficulty: MissionDifficultyEnum,
                    status: MissionStatusEnum,
                    created_at: i64,
                    started_at: ?i64,
                    expires_at: ?i64,
                    completed_at: ?i64,
                    rewards: ?struct {
                        money: i64,
                        credits: i64,
                        pub const json_schema = "{\"required\":[\"money\",\"credits\"],\"properties\":{\"money\":{\"type\":\"integer\",\"format\":\"int32\"},\"credits\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                    },
                    pub const json_schema = "{\"required\":[\"title\",\"difficulty\",\"status\",\"created_at\",\"started_at\",\"expires_at\",\"completed_at\",\"rewards\"],\"properties\":{\"title\":{\"type\":\"string\"},\"difficulty\":{\"$ref\":\"#/components/schemas/MissionDifficultyEnum\"},\"status\":{\"$ref\":\"#/components/schemas/MissionStatusEnum\"},\"created_at\":{\"type\":\"integer\",\"format\":\"int32\"},\"started_at\":{\"description\":\"Null if the status is 'Available'.\",\"oneOf\":[{\"type\":\"integer\",\"format\":\"int32\"},{\"type\":\"null\"}]},\"expires_at\":{\"description\":\"Null if the status is not 'Accepted'.\",\"oneOf\":[{\"type\":\"integer\",\"format\":\"int32\"},{\"type\":\"null\"}]},\"completed_at\":{\"description\":\"Null if the status is not 'Failed' or 'Completed'.\",\"oneOf\":[{\"type\":\"integer\",\"format\":\"int32\"},{\"type\":\"null\"}]},\"rewards\":{\"description\":\"Null if the status is not 'Completed'.\",\"oneOf\":[{\"required\":[\"money\",\"credits\"],\"properties\":{\"money\":{\"type\":\"integer\",\"format\":\"int32\"},\"credits\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},{\"type\":\"null\"}]}},\"type\":\"object\"}";
                },
                pub const json_schema = "{\"required\":[\"id\",\"name\",\"contracts\"],\"properties\":{\"id\":{\"$ref\":\"#/components/schemas/UserId\"},\"name\":{\"type\":\"string\"},\"contracts\":{\"type\":\"array\",\"items\":{\"required\":[\"title\",\"difficulty\",\"status\",\"created_at\",\"started_at\",\"expires_at\",\"completed_at\",\"rewards\"],\"properties\":{\"title\":{\"type\":\"string\"},\"difficulty\":{\"$ref\":\"#/components/schemas/MissionDifficultyEnum\"},\"status\":{\"$ref\":\"#/components/schemas/MissionStatusEnum\"},\"created_at\":{\"type\":\"integer\",\"format\":\"int32\"},\"started_at\":{\"description\":\"Null if the status is 'Available'.\",\"oneOf\":[{\"type\":\"integer\",\"format\":\"int32\"},{\"type\":\"null\"}]},\"expires_at\":{\"description\":\"Null if the status is not 'Accepted'.\",\"oneOf\":[{\"type\":\"integer\",\"format\":\"int32\"},{\"type\":\"null\"}]},\"completed_at\":{\"description\":\"Null if the status is not 'Failed' or 'Completed'.\",\"oneOf\":[{\"type\":\"integer\",\"format\":\"int32\"},{\"type\":\"null\"}]},\"rewards\":{\"description\":\"Null if the status is not 'Completed'.\",\"oneOf\":[{\"required\":[\"money\",\"credits\"],\"properties\":{\"money\":{\"type\":\"integer\",\"format\":\"int32\"},\"credits\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},{\"type\":\"null\"}]}},\"type\":\"object\"}}},\"type\":\"object\"}";
            },
            rewards: []const struct {
                type: union(enum) {
                    v0: MissionRewardUpgrade,
                    v1: []const u8,
                },
                details: union(enum) {
                    v0: MissionRewardDetailsAmmo,
                    v1: MissionRewardDetailsUpgrade,
                    v2: MissionRewardDetailsItem,
                },
                amount: i64,
                cost: i64,
                expires_at: i64,
                pub const json_schema = "{\"required\":[\"type\",\"details\",\"amount\",\"cost\",\"expires_at\"],\"properties\":{\"type\":{\"oneOf\":[{\"$ref\":\"#/components/schemas/MissionRewardUpgrade\"},{\"type\":\"string\"}]},\"details\":{\"description\":\"The response depends on the 'type' value.\",\"oneOf\":[{\"$ref\":\"#/components/schemas/MissionRewardDetailsAmmo\"},{\"$ref\":\"#/components/schemas/MissionRewardDetailsUpgrade\"},{\"$ref\":\"#/components/schemas/MissionRewardDetailsItem\"}]},\"amount\":{\"type\":\"integer\",\"format\":\"int32\"},\"cost\":{\"type\":\"integer\",\"format\":\"int32\"},\"expires_at\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
            },
            pub const json_schema = "{\"required\":[\"credits\",\"givers\",\"rewards\"],\"properties\":{\"credits\":{\"type\":\"integer\",\"format\":\"int32\"},\"givers\":{\"type\":\"array\",\"items\":{\"required\":[\"id\",\"name\",\"contracts\"],\"properties\":{\"id\":{\"$ref\":\"#/components/schemas/UserId\"},\"name\":{\"type\":\"string\"},\"contracts\":{\"type\":\"array\",\"items\":{\"required\":[\"title\",\"difficulty\",\"status\",\"created_at\",\"started_at\",\"expires_at\",\"completed_at\",\"rewards\"],\"properties\":{\"title\":{\"type\":\"string\"},\"difficulty\":{\"$ref\":\"#/components/schemas/MissionDifficultyEnum\"},\"status\":{\"$ref\":\"#/components/schemas/MissionStatusEnum\"},\"created_at\":{\"type\":\"integer\",\"format\":\"int32\"},\"started_at\":{\"description\":\"Null if the status is 'Available'.\",\"oneOf\":[{\"type\":\"integer\",\"format\":\"int32\"},{\"type\":\"null\"}]},\"expires_at\":{\"description\":\"Null if the status is not 'Accepted'.\",\"oneOf\":[{\"type\":\"integer\",\"format\":\"int32\"},{\"type\":\"null\"}]},\"completed_at\":{\"description\":\"Null if the status is not 'Failed' or 'Completed'.\",\"oneOf\":[{\"type\":\"integer\",\"format\":\"int32\"},{\"type\":\"null\"}]},\"rewards\":{\"description\":\"Null if the status is not 'Completed'.\",\"oneOf\":[{\"required\":[\"money\",\"credits\"],\"properties\":{\"money\":{\"type\":\"integer\",\"format\":\"int32\"},\"credits\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},{\"type\":\"null\"}]}},\"type\":\"object\"}}},\"type\":\"object\"}},\"rewards\":{\"type\":\"array\",\"items\":{\"required\":[\"type\",\"details\",\"amount\",\"cost\",\"expires_at\"],\"properties\":{\"type\":{\"oneOf\":[{\"$ref\":\"#/components/schemas/MissionRewardUpgrade\"},{\"type\":\"string\"}]},\"details\":{\"description\":\"The response depends on the 'type' value.\",\"oneOf\":[{\"$ref\":\"#/components/schemas/MissionRewardDetailsAmmo\"},{\"$ref\":\"#/components/schemas/MissionRewardDetailsUpgrade\"},{\"$ref\":\"#/components/schemas/MissionRewardDetailsItem\"}]},\"amount\":{\"type\":\"integer\",\"format\":\"int32\"},\"cost\":{\"type\":\"integer\",\"format\":\"int32\"},\"expires_at\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}}},\"type\":\"object\"}";
        }) = .absent,
        personalstats: model.Presence(union(enum) {
            v0: struct {
                attacking: struct {
                    attacks: struct {
                        won: i64,
                        lost: i64,
                        stalemate: i64,
                        assist: i64,
                        stealth: i64,
                        pub const json_schema = "{\"required\":[\"won\",\"lost\",\"stalemate\",\"assist\",\"stealth\"],\"properties\":{\"won\":{\"type\":\"integer\",\"format\":\"int32\"},\"lost\":{\"type\":\"integer\",\"format\":\"int32\"},\"stalemate\":{\"type\":\"integer\",\"format\":\"int32\"},\"assist\":{\"type\":\"integer\",\"format\":\"int32\"},\"stealth\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                    },
                    defends: struct {
                        won: i64,
                        lost: i64,
                        stalemate: i64,
                        total: i64,
                        pub const json_schema = "{\"required\":[\"won\",\"lost\",\"stalemate\",\"total\"],\"properties\":{\"won\":{\"type\":\"integer\",\"format\":\"int32\"},\"lost\":{\"type\":\"integer\",\"format\":\"int32\"},\"stalemate\":{\"type\":\"integer\",\"format\":\"int32\"},\"total\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                    },
                    elo: i64,
                    unarmored_wins: i64,
                    highest_level_beaten: i64,
                    escapes: struct {
                        player: i64,
                        foes: i64,
                        pub const json_schema = "{\"required\":[\"player\",\"foes\"],\"properties\":{\"player\":{\"type\":\"integer\",\"format\":\"int32\"},\"foes\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                    },
                    killstreak: struct {
                        best: i64,
                        current: i64,
                        pub const json_schema = "{\"required\":[\"best\",\"current\"],\"properties\":{\"best\":{\"type\":\"integer\",\"format\":\"int32\"},\"current\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                    },
                    hits: struct {
                        success: i64,
                        miss: i64,
                        critical: i64,
                        one_hit_kills: i64,
                        pub const json_schema = "{\"required\":[\"success\",\"miss\",\"critical\",\"one_hit_kills\"],\"properties\":{\"success\":{\"type\":\"integer\",\"format\":\"int32\"},\"miss\":{\"type\":\"integer\",\"format\":\"int32\"},\"critical\":{\"type\":\"integer\",\"format\":\"int32\"},\"one_hit_kills\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                    },
                    damage: struct {
                        total: i64,
                        best: i64,
                        pub const json_schema = "{\"required\":[\"total\",\"best\"],\"properties\":{\"total\":{\"type\":\"integer\",\"format\":\"int64\"},\"best\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                    },
                    networth: struct {
                        money_mugged: i64,
                        largest_mug: i64,
                        items_looted: i64,
                        pub const json_schema = "{\"required\":[\"money_mugged\",\"largest_mug\",\"items_looted\"],\"properties\":{\"money_mugged\":{\"type\":\"integer\",\"format\":\"int64\"},\"largest_mug\":{\"type\":\"integer\",\"format\":\"int64\"},\"items_looted\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                    },
                    ammunition: struct {
                        total: i64,
                        special: i64,
                        hollow_point: i64,
                        tracer: i64,
                        piercing: i64,
                        incendiary: i64,
                        pub const json_schema = "{\"required\":[\"total\",\"special\",\"hollow_point\",\"tracer\",\"piercing\",\"incendiary\"],\"properties\":{\"total\":{\"type\":\"integer\",\"format\":\"int32\"},\"special\":{\"type\":\"integer\",\"format\":\"int32\"},\"hollow_point\":{\"type\":\"integer\",\"format\":\"int32\"},\"tracer\":{\"type\":\"integer\",\"format\":\"int32\"},\"piercing\":{\"type\":\"integer\",\"format\":\"int32\"},\"incendiary\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                    },
                    faction: struct {
                        respect: i64,
                        retaliations: i64,
                        ranked_war_hits: i64,
                        raid_hits: i64,
                        territory: struct {
                            wall_joins: i64,
                            wall_clears: i64,
                            wall_time: i64,
                            pub const json_schema = "{\"required\":[\"wall_joins\",\"wall_clears\",\"wall_time\"],\"properties\":{\"wall_joins\":{\"type\":\"integer\",\"format\":\"int32\"},\"wall_clears\":{\"type\":\"integer\",\"format\":\"int32\"},\"wall_time\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                        },
                        pub const json_schema = "{\"required\":[\"respect\",\"retaliations\",\"ranked_war_hits\",\"raid_hits\",\"territory\"],\"properties\":{\"respect\":{\"type\":\"integer\",\"format\":\"int32\"},\"retaliations\":{\"type\":\"integer\",\"format\":\"int32\"},\"ranked_war_hits\":{\"type\":\"integer\",\"format\":\"int32\"},\"raid_hits\":{\"type\":\"integer\",\"format\":\"int32\"},\"territory\":{\"required\":[\"wall_joins\",\"wall_clears\",\"wall_time\"],\"properties\":{\"wall_joins\":{\"type\":\"integer\",\"format\":\"int32\"},\"wall_clears\":{\"type\":\"integer\",\"format\":\"int32\"},\"wall_time\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}},\"type\":\"object\"}";
                    },
                    pub const json_schema = "{\"required\":[\"attacks\",\"defends\",\"elo\",\"unarmored_wins\",\"highest_level_beaten\",\"escapes\",\"killstreak\",\"hits\",\"damage\",\"networth\",\"ammunition\",\"faction\"],\"properties\":{\"attacks\":{\"required\":[\"won\",\"lost\",\"stalemate\",\"assist\",\"stealth\"],\"properties\":{\"won\":{\"type\":\"integer\",\"format\":\"int32\"},\"lost\":{\"type\":\"integer\",\"format\":\"int32\"},\"stalemate\":{\"type\":\"integer\",\"format\":\"int32\"},\"assist\":{\"type\":\"integer\",\"format\":\"int32\"},\"stealth\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"defends\":{\"required\":[\"won\",\"lost\",\"stalemate\",\"total\"],\"properties\":{\"won\":{\"type\":\"integer\",\"format\":\"int32\"},\"lost\":{\"type\":\"integer\",\"format\":\"int32\"},\"stalemate\":{\"type\":\"integer\",\"format\":\"int32\"},\"total\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"elo\":{\"type\":\"integer\",\"format\":\"int32\"},\"unarmored_wins\":{\"type\":\"integer\",\"format\":\"int32\"},\"highest_level_beaten\":{\"type\":\"integer\",\"format\":\"int32\"},\"escapes\":{\"required\":[\"player\",\"foes\"],\"properties\":{\"player\":{\"type\":\"integer\",\"format\":\"int32\"},\"foes\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"killstreak\":{\"required\":[\"best\",\"current\"],\"properties\":{\"best\":{\"type\":\"integer\",\"format\":\"int32\"},\"current\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"hits\":{\"required\":[\"success\",\"miss\",\"critical\",\"one_hit_kills\"],\"properties\":{\"success\":{\"type\":\"integer\",\"format\":\"int32\"},\"miss\":{\"type\":\"integer\",\"format\":\"int32\"},\"critical\":{\"type\":\"integer\",\"format\":\"int32\"},\"one_hit_kills\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"damage\":{\"required\":[\"total\",\"best\"],\"properties\":{\"total\":{\"type\":\"integer\",\"format\":\"int64\"},\"best\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"networth\":{\"required\":[\"money_mugged\",\"largest_mug\",\"items_looted\"],\"properties\":{\"money_mugged\":{\"type\":\"integer\",\"format\":\"int64\"},\"largest_mug\":{\"type\":\"integer\",\"format\":\"int64\"},\"items_looted\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"ammunition\":{\"required\":[\"total\",\"special\",\"hollow_point\",\"tracer\",\"piercing\",\"incendiary\"],\"properties\":{\"total\":{\"type\":\"integer\",\"format\":\"int32\"},\"special\":{\"type\":\"integer\",\"format\":\"int32\"},\"hollow_point\":{\"type\":\"integer\",\"format\":\"int32\"},\"tracer\":{\"type\":\"integer\",\"format\":\"int32\"},\"piercing\":{\"type\":\"integer\",\"format\":\"int32\"},\"incendiary\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"faction\":{\"required\":[\"respect\",\"retaliations\",\"ranked_war_hits\",\"raid_hits\",\"territory\"],\"properties\":{\"respect\":{\"type\":\"integer\",\"format\":\"int32\"},\"retaliations\":{\"type\":\"integer\",\"format\":\"int32\"},\"ranked_war_hits\":{\"type\":\"integer\",\"format\":\"int32\"},\"raid_hits\":{\"type\":\"integer\",\"format\":\"int32\"},\"territory\":{\"required\":[\"wall_joins\",\"wall_clears\",\"wall_time\"],\"properties\":{\"wall_joins\":{\"type\":\"integer\",\"format\":\"int32\"},\"wall_clears\":{\"type\":\"integer\",\"format\":\"int32\"},\"wall_time\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}},\"type\":\"object\"}},\"type\":\"object\"}";
                },
                battle_stats: struct {
                    strength: i64,
                    defense: i64,
                    speed: i64,
                    dexterity: i64,
                    total: i64,
                    pub const json_schema = "{\"required\":[\"strength\",\"defense\",\"speed\",\"dexterity\",\"total\"],\"properties\":{\"strength\":{\"type\":\"integer\",\"format\":\"int64\"},\"defense\":{\"type\":\"integer\",\"format\":\"int64\"},\"speed\":{\"type\":\"integer\",\"format\":\"int64\"},\"dexterity\":{\"type\":\"integer\",\"format\":\"int64\"},\"total\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}";
                },
                jobs: struct {
                    job_points_used: i64,
                    trains_received: i64,
                    stats: struct {
                        manual: i64,
                        intelligence: i64,
                        endurance: i64,
                        total: i64,
                        pub const json_schema = "{\"required\":[\"manual\",\"intelligence\",\"endurance\",\"total\"],\"properties\":{\"manual\":{\"type\":\"integer\",\"format\":\"int32\"},\"intelligence\":{\"type\":\"integer\",\"format\":\"int32\"},\"endurance\":{\"type\":\"integer\",\"format\":\"int32\"},\"total\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                    },
                    pub const json_schema = "{\"required\":[\"job_points_used\",\"trains_received\",\"stats\"],\"properties\":{\"job_points_used\":{\"type\":\"integer\",\"format\":\"int32\"},\"trains_received\":{\"type\":\"integer\",\"format\":\"int32\"},\"stats\":{\"required\":[\"manual\",\"intelligence\",\"endurance\",\"total\"],\"properties\":{\"manual\":{\"type\":\"integer\",\"format\":\"int32\"},\"intelligence\":{\"type\":\"integer\",\"format\":\"int32\"},\"endurance\":{\"type\":\"integer\",\"format\":\"int32\"},\"total\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}},\"type\":\"object\"}";
                },
                trading: struct {
                    items: struct {
                        bought: struct {
                            market: i64,
                            shops: i64,
                            pub const json_schema = "{\"required\":[\"market\",\"shops\"],\"properties\":{\"market\":{\"type\":\"integer\",\"format\":\"int32\"},\"shops\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                        },
                        auctions: struct {
                            won: i64,
                            sold: i64,
                            pub const json_schema = "{\"required\":[\"won\",\"sold\"],\"properties\":{\"won\":{\"type\":\"integer\",\"format\":\"int32\"},\"sold\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                        },
                        sent: i64,
                        pub const json_schema = "{\"required\":[\"bought\",\"sent\",\"auctions\"],\"properties\":{\"bought\":{\"required\":[\"market\",\"shops\"],\"properties\":{\"market\":{\"type\":\"integer\",\"format\":\"int32\"},\"shops\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"auctions\":{\"required\":[\"won\",\"sold\"],\"properties\":{\"won\":{\"type\":\"integer\",\"format\":\"int32\"},\"sold\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"sent\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                    },
                    trades: i64,
                    points: struct {
                        bought: i64,
                        sold: i64,
                        pub const json_schema = "{\"required\":[\"bought\",\"sold\"],\"properties\":{\"bought\":{\"type\":\"integer\",\"format\":\"int32\"},\"sold\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                    },
                    bazaar: struct {
                        customers: i64,
                        sales: i64,
                        profit: i64,
                        pub const json_schema = "{\"required\":[\"customers\",\"sales\",\"profit\"],\"properties\":{\"customers\":{\"type\":\"integer\",\"format\":\"int32\"},\"sales\":{\"type\":\"integer\",\"format\":\"int32\"},\"profit\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}";
                    },
                    item_market: model.Presence(struct {
                        customers: i64,
                        sales: i64,
                        revenue: i64,
                        fees: i64,
                        pub const json_schema = "{\"required\":[\"customers\",\"sales\",\"revenue\",\"fees\"],\"properties\":{\"customers\":{\"type\":\"integer\",\"format\":\"int32\"},\"sales\":{\"type\":\"integer\",\"format\":\"int32\"},\"revenue\":{\"type\":\"integer\",\"format\":\"int64\"},\"fees\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}";
                    }) = .absent,
                    pub const json_schema = "{\"required\":[\"items\",\"trades\",\"points\",\"bazaar\"],\"properties\":{\"items\":{\"required\":[\"bought\",\"sent\",\"auctions\"],\"properties\":{\"bought\":{\"required\":[\"market\",\"shops\"],\"properties\":{\"market\":{\"type\":\"integer\",\"format\":\"int32\"},\"shops\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"auctions\":{\"required\":[\"won\",\"sold\"],\"properties\":{\"won\":{\"type\":\"integer\",\"format\":\"int32\"},\"sold\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"sent\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"trades\":{\"type\":\"integer\",\"format\":\"int32\"},\"points\":{\"required\":[\"bought\",\"sold\"],\"properties\":{\"bought\":{\"type\":\"integer\",\"format\":\"int32\"},\"sold\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"bazaar\":{\"required\":[\"customers\",\"sales\",\"profit\"],\"properties\":{\"customers\":{\"type\":\"integer\",\"format\":\"int32\"},\"sales\":{\"type\":\"integer\",\"format\":\"int32\"},\"profit\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"},\"item_market\":{\"required\":[\"customers\",\"sales\",\"revenue\",\"fees\"],\"properties\":{\"customers\":{\"type\":\"integer\",\"format\":\"int32\"},\"sales\":{\"type\":\"integer\",\"format\":\"int32\"},\"revenue\":{\"type\":\"integer\",\"format\":\"int64\"},\"fees\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}},\"type\":\"object\"}";
                },
                jail: struct {
                    times_jailed: i64,
                    busts: struct {
                        success: i64,
                        fails: i64,
                        pub const json_schema = "{\"required\":[\"success\",\"fails\"],\"properties\":{\"success\":{\"type\":\"integer\",\"format\":\"int32\"},\"fails\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                    },
                    bails: struct {
                        amount: i64,
                        fees: i64,
                        pub const json_schema = "{\"required\":[\"amount\",\"fees\"],\"properties\":{\"amount\":{\"type\":\"integer\",\"format\":\"int32\"},\"fees\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}";
                    },
                    pub const json_schema = "{\"required\":[\"times_jailed\",\"busts\",\"bails\"],\"properties\":{\"times_jailed\":{\"type\":\"integer\",\"format\":\"int32\"},\"busts\":{\"required\":[\"success\",\"fails\"],\"properties\":{\"success\":{\"type\":\"integer\",\"format\":\"int32\"},\"fails\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"bails\":{\"required\":[\"amount\",\"fees\"],\"properties\":{\"amount\":{\"type\":\"integer\",\"format\":\"int32\"},\"fees\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}},\"type\":\"object\"}";
                },
                hospital: struct {
                    times_hospitalized: i64,
                    medical_items_used: i64,
                    blood_withdrawn: i64,
                    reviving: struct {
                        skill: i64,
                        revives: i64,
                        revives_received: i64,
                        pub const json_schema = "{\"required\":[\"skill\",\"revives\",\"revives_received\"],\"properties\":{\"skill\":{\"type\":\"integer\",\"format\":\"int32\"},\"revives\":{\"type\":\"integer\",\"format\":\"int32\"},\"revives_received\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                    },
                    pub const json_schema = "{\"required\":[\"times_hospitalized\",\"medical_items_used\",\"blood_withdrawn\",\"reviving\"],\"properties\":{\"times_hospitalized\":{\"type\":\"integer\",\"format\":\"int32\"},\"medical_items_used\":{\"type\":\"integer\",\"format\":\"int32\"},\"blood_withdrawn\":{\"type\":\"integer\",\"format\":\"int32\"},\"reviving\":{\"required\":[\"skill\",\"revives\",\"revives_received\"],\"properties\":{\"skill\":{\"type\":\"integer\",\"format\":\"int32\"},\"revives\":{\"type\":\"integer\",\"format\":\"int32\"},\"revives_received\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}},\"type\":\"object\"}";
                },
                finishing_hits: struct {
                    heavy_artillery: i64,
                    machine_guns: i64,
                    rifles: i64,
                    sub_machine_guns: i64,
                    shotguns: i64,
                    pistols: i64,
                    temporary: i64,
                    piercing: i64,
                    slashing: i64,
                    clubbing: i64,
                    mechanical: i64,
                    hand_to_hand: i64,
                    pub const json_schema = "{\"required\":[\"heavy_artillery\",\"machine_guns\",\"rifles\",\"sub_machine_guns\",\"shotguns\",\"pistols\",\"temporary\",\"piercing\",\"slashing\",\"clubbing\",\"mechanical\",\"hand_to_hand\"],\"properties\":{\"heavy_artillery\":{\"type\":\"integer\",\"format\":\"int32\"},\"machine_guns\":{\"type\":\"integer\",\"format\":\"int32\"},\"rifles\":{\"type\":\"integer\",\"format\":\"int32\"},\"sub_machine_guns\":{\"type\":\"integer\",\"format\":\"int32\"},\"shotguns\":{\"type\":\"integer\",\"format\":\"int32\"},\"pistols\":{\"type\":\"integer\",\"format\":\"int32\"},\"temporary\":{\"type\":\"integer\",\"format\":\"int32\"},\"piercing\":{\"type\":\"integer\",\"format\":\"int32\"},\"slashing\":{\"type\":\"integer\",\"format\":\"int32\"},\"clubbing\":{\"type\":\"integer\",\"format\":\"int32\"},\"mechanical\":{\"type\":\"integer\",\"format\":\"int32\"},\"hand_to_hand\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                },
                communication: struct {
                    mails_sent: struct {
                        total: i64,
                        friends: i64,
                        faction: i64,
                        colleagues: i64,
                        spouse: i64,
                        pub const json_schema = "{\"required\":[\"total\",\"friends\",\"faction\",\"colleagues\",\"spouse\"],\"properties\":{\"total\":{\"type\":\"integer\",\"format\":\"int32\"},\"friends\":{\"type\":\"integer\",\"format\":\"int32\"},\"faction\":{\"type\":\"integer\",\"format\":\"int32\"},\"colleagues\":{\"type\":\"integer\",\"format\":\"int32\"},\"spouse\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                    },
                    classified_ads: i64,
                    personals: i64,
                    pub const json_schema = "{\"required\":[\"mails_sent\",\"classified_ads\",\"personals\"],\"properties\":{\"mails_sent\":{\"required\":[\"total\",\"friends\",\"faction\",\"colleagues\",\"spouse\"],\"properties\":{\"total\":{\"type\":\"integer\",\"format\":\"int32\"},\"friends\":{\"type\":\"integer\",\"format\":\"int32\"},\"faction\":{\"type\":\"integer\",\"format\":\"int32\"},\"colleagues\":{\"type\":\"integer\",\"format\":\"int32\"},\"spouse\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"classified_ads\":{\"type\":\"integer\",\"format\":\"int32\"},\"personals\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                },
                crimes: union(enum) {
                    v0: PersonalStatsCrimesV1,
                    v1: PersonalStatsCrimesV2,
                },
                bounties: struct {
                    placed: struct {
                        amount: i64,
                        value: i64,
                        pub const json_schema = "{\"required\":[\"amount\",\"value\"],\"properties\":{\"amount\":{\"type\":\"integer\",\"format\":\"int32\"},\"value\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}";
                    },
                    collected: struct {
                        amount: i64,
                        value: i64,
                        pub const json_schema = "{\"required\":[\"amount\",\"value\"],\"properties\":{\"amount\":{\"type\":\"integer\",\"format\":\"int32\"},\"value\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}";
                    },
                    received: struct {
                        amount: i64,
                        value: i64,
                        pub const json_schema = "{\"required\":[\"amount\",\"value\"],\"properties\":{\"amount\":{\"type\":\"integer\",\"format\":\"int32\"},\"value\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}";
                    },
                    pub const json_schema = "{\"required\":[\"placed\",\"collected\",\"received\"],\"properties\":{\"placed\":{\"required\":[\"amount\",\"value\"],\"properties\":{\"amount\":{\"type\":\"integer\",\"format\":\"int32\"},\"value\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"},\"collected\":{\"required\":[\"amount\",\"value\"],\"properties\":{\"amount\":{\"type\":\"integer\",\"format\":\"int32\"},\"value\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"},\"received\":{\"required\":[\"amount\",\"value\"],\"properties\":{\"amount\":{\"type\":\"integer\",\"format\":\"int32\"},\"value\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}},\"type\":\"object\"}";
                },
                investments: struct {
                    bank: struct {
                        total: i64,
                        profit: i64,
                        current: i64,
                        time_remaining: i64,
                        pub const json_schema = "{\"required\":[\"total\",\"profit\",\"current\",\"time_remaining\"],\"properties\":{\"total\":{\"type\":\"integer\",\"format\":\"int64\"},\"profit\":{\"type\":\"integer\",\"format\":\"int64\"},\"current\":{\"type\":\"integer\",\"format\":\"int64\"},\"time_remaining\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                    },
                    stocks: struct {
                        profits: i64,
                        losses: i64,
                        fees: i64,
                        net_profits: i64,
                        payouts: i64,
                        pub const json_schema = "{\"required\":[\"profits\",\"losses\",\"fees\",\"net_profits\",\"payouts\"],\"properties\":{\"profits\":{\"type\":\"integer\",\"format\":\"int64\"},\"losses\":{\"type\":\"integer\",\"format\":\"int64\"},\"fees\":{\"type\":\"integer\",\"format\":\"int64\"},\"net_profits\":{\"type\":\"integer\",\"format\":\"int64\"},\"payouts\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}";
                    },
                    pub const json_schema = "{\"required\":[\"bank\",\"stocks\"],\"properties\":{\"bank\":{\"required\":[\"total\",\"profit\",\"current\",\"time_remaining\"],\"properties\":{\"total\":{\"type\":\"integer\",\"format\":\"int64\"},\"profit\":{\"type\":\"integer\",\"format\":\"int64\"},\"current\":{\"type\":\"integer\",\"format\":\"int64\"},\"time_remaining\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"stocks\":{\"required\":[\"profits\",\"losses\",\"fees\",\"net_profits\",\"payouts\"],\"properties\":{\"profits\":{\"type\":\"integer\",\"format\":\"int64\"},\"losses\":{\"type\":\"integer\",\"format\":\"int64\"},\"fees\":{\"type\":\"integer\",\"format\":\"int64\"},\"net_profits\":{\"type\":\"integer\",\"format\":\"int64\"},\"payouts\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}},\"type\":\"object\"}";
                },
                items: struct {
                    found: struct {
                        city: i64,
                        dump: i64,
                        easter_eggs: i64,
                        pub const json_schema = "{\"required\":[\"city\",\"dump\",\"easter_eggs\"],\"properties\":{\"city\":{\"type\":\"integer\",\"format\":\"int32\"},\"dump\":{\"type\":\"integer\",\"format\":\"int32\"},\"easter_eggs\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                    },
                    trashed: i64,
                    used: struct {
                        books: i64,
                        boosters: i64,
                        consumables: i64,
                        candy: i64,
                        alcohol: i64,
                        energy_drinks: i64,
                        stat_enhancers: i64,
                        easter_eggs: i64,
                        pub const json_schema = "{\"required\":[\"books\",\"boosters\",\"consumables\",\"candy\",\"alcohol\",\"energy_drinks\",\"stat_enhancers\",\"easter_eggs\"],\"properties\":{\"books\":{\"type\":\"integer\",\"format\":\"int32\"},\"boosters\":{\"type\":\"integer\",\"format\":\"int32\"},\"consumables\":{\"type\":\"integer\",\"format\":\"int32\"},\"candy\":{\"type\":\"integer\",\"format\":\"int32\"},\"alcohol\":{\"type\":\"integer\",\"format\":\"int32\"},\"energy_drinks\":{\"type\":\"integer\",\"format\":\"int32\"},\"stat_enhancers\":{\"type\":\"integer\",\"format\":\"int32\"},\"easter_eggs\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                    },
                    viruses_coded: i64,
                    pub const json_schema = "{\"required\":[\"found\",\"trashed\",\"used\",\"viruses_coded\"],\"properties\":{\"found\":{\"required\":[\"city\",\"dump\",\"easter_eggs\"],\"properties\":{\"city\":{\"type\":\"integer\",\"format\":\"int32\"},\"dump\":{\"type\":\"integer\",\"format\":\"int32\"},\"easter_eggs\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"trashed\":{\"type\":\"integer\",\"format\":\"int32\"},\"used\":{\"required\":[\"books\",\"boosters\",\"consumables\",\"candy\",\"alcohol\",\"energy_drinks\",\"stat_enhancers\",\"easter_eggs\"],\"properties\":{\"books\":{\"type\":\"integer\",\"format\":\"int32\"},\"boosters\":{\"type\":\"integer\",\"format\":\"int32\"},\"consumables\":{\"type\":\"integer\",\"format\":\"int32\"},\"candy\":{\"type\":\"integer\",\"format\":\"int32\"},\"alcohol\":{\"type\":\"integer\",\"format\":\"int32\"},\"energy_drinks\":{\"type\":\"integer\",\"format\":\"int32\"},\"stat_enhancers\":{\"type\":\"integer\",\"format\":\"int32\"},\"easter_eggs\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"viruses_coded\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                },
                travel: struct {
                    total: i64,
                    time_spent: i64,
                    items_bought: i64,
                    hunting: struct {
                        skill: i64,
                        pub const json_schema = "{\"required\":[\"skill\"],\"properties\":{\"skill\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                    },
                    attacks_won: i64,
                    defends_lost: i64,
                    argentina: i64,
                    canada: i64,
                    cayman_islands: i64,
                    china: i64,
                    hawaii: i64,
                    japan: i64,
                    mexico: i64,
                    united_arab_emirates: i64,
                    united_kingdom: i64,
                    south_africa: i64,
                    switzerland: i64,
                    pub const json_schema = "{\"required\":[\"total\",\"time_spent\",\"items_bought\",\"hunting\",\"attacks_won\",\"defends_lost\",\"argentina\",\"canada\",\"cayman_islands\",\"china\",\"hawaii\",\"japan\",\"mexico\",\"united_arab_emirates\",\"united_kingdom\",\"south_africa\",\"switzerland\"],\"properties\":{\"total\":{\"type\":\"integer\",\"format\":\"int32\"},\"time_spent\":{\"type\":\"integer\",\"format\":\"int32\"},\"items_bought\":{\"type\":\"integer\",\"format\":\"int32\"},\"hunting\":{\"required\":[\"skill\"],\"properties\":{\"skill\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"attacks_won\":{\"type\":\"integer\",\"format\":\"int32\"},\"defends_lost\":{\"type\":\"integer\",\"format\":\"int32\"},\"argentina\":{\"type\":\"integer\",\"format\":\"int32\"},\"canada\":{\"type\":\"integer\",\"format\":\"int32\"},\"cayman_islands\":{\"type\":\"integer\",\"format\":\"int32\"},\"china\":{\"type\":\"integer\",\"format\":\"int32\"},\"hawaii\":{\"type\":\"integer\",\"format\":\"int32\"},\"japan\":{\"type\":\"integer\",\"format\":\"int32\"},\"mexico\":{\"type\":\"integer\",\"format\":\"int32\"},\"united_arab_emirates\":{\"type\":\"integer\",\"format\":\"int32\"},\"united_kingdom\":{\"type\":\"integer\",\"format\":\"int32\"},\"south_africa\":{\"type\":\"integer\",\"format\":\"int32\"},\"switzerland\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                },
                drugs: struct {
                    cannabis: i64,
                    ecstasy: i64,
                    ketamine: i64,
                    lsd: i64,
                    opium: i64,
                    pcp: i64,
                    shrooms: i64,
                    speed: i64,
                    vicodin: i64,
                    xanax: i64,
                    total: i64,
                    overdoses: i64,
                    rehabilitations: struct {
                        amount: i64,
                        fees: i64,
                        pub const json_schema = "{\"required\":[\"amount\",\"fees\"],\"properties\":{\"amount\":{\"type\":\"integer\",\"format\":\"int32\"},\"fees\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}";
                    },
                    pub const json_schema = "{\"required\":[\"cannabis\",\"ecstasy\",\"ketamine\",\"lsd\",\"opium\",\"pcp\",\"shrooms\",\"speed\",\"vicodin\",\"xanax\",\"total\",\"overdoses\",\"rehabilitations\"],\"properties\":{\"cannabis\":{\"type\":\"integer\",\"format\":\"int32\"},\"ecstasy\":{\"type\":\"integer\",\"format\":\"int32\"},\"ketamine\":{\"type\":\"integer\",\"format\":\"int32\"},\"lsd\":{\"type\":\"integer\",\"format\":\"int32\"},\"opium\":{\"type\":\"integer\",\"format\":\"int32\"},\"pcp\":{\"type\":\"integer\",\"format\":\"int32\"},\"shrooms\":{\"type\":\"integer\",\"format\":\"int32\"},\"speed\":{\"type\":\"integer\",\"format\":\"int32\"},\"vicodin\":{\"type\":\"integer\",\"format\":\"int32\"},\"xanax\":{\"type\":\"integer\",\"format\":\"int32\"},\"total\":{\"type\":\"integer\",\"format\":\"int32\"},\"overdoses\":{\"type\":\"integer\",\"format\":\"int32\"},\"rehabilitations\":{\"required\":[\"amount\",\"fees\"],\"properties\":{\"amount\":{\"type\":\"integer\",\"format\":\"int32\"},\"fees\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}},\"type\":\"object\"}";
                },
                missions: struct {
                    missions: i64,
                    contracts: struct {
                        total: i64,
                        duke: i64,
                        pub const json_schema = "{\"required\":[\"total\",\"duke\"],\"properties\":{\"total\":{\"type\":\"integer\",\"format\":\"int32\"},\"duke\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                    },
                    credits: i64,
                    pub const json_schema = "{\"required\":[\"missions\",\"contracts\",\"credits\"],\"properties\":{\"missions\":{\"type\":\"integer\",\"format\":\"int32\"},\"contracts\":{\"required\":[\"total\",\"duke\"],\"properties\":{\"total\":{\"type\":\"integer\",\"format\":\"int32\"},\"duke\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"credits\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                },
                racing: struct {
                    skill: i64,
                    points: i64,
                    races: struct {
                        entered: i64,
                        won: i64,
                        pub const json_schema = "{\"required\":[\"entered\",\"won\"],\"properties\":{\"entered\":{\"type\":\"integer\",\"format\":\"int32\"},\"won\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                    },
                    pub const json_schema = "{\"required\":[\"skill\",\"points\",\"races\"],\"properties\":{\"skill\":{\"type\":\"integer\",\"format\":\"int32\"},\"points\":{\"type\":\"integer\",\"format\":\"int32\"},\"races\":{\"required\":[\"entered\",\"won\"],\"properties\":{\"entered\":{\"type\":\"integer\",\"format\":\"int32\"},\"won\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}},\"type\":\"object\"}";
                },
                networth: struct {
                    total: i64,
                    wallet: i64,
                    vaults: i64,
                    bank: i64,
                    overseas_bank: i64,
                    points: i64,
                    inventory: i64,
                    display_case: i64,
                    bazaar: i64,
                    item_market: i64,
                    property: i64,
                    stock_market: i64,
                    auction_house: i64,
                    bookie: i64,
                    company: i64,
                    enlisted_cars: i64,
                    piggy_bank: i64,
                    pending: i64,
                    loans: i64,
                    unpaid_fees: i64,
                    pub const json_schema = "{\"required\":[\"total\",\"wallet\",\"vaults\",\"bank\",\"overseas_bank\",\"points\",\"inventory\",\"display_case\",\"bazaar\",\"item_market\",\"property\",\"stock_market\",\"auction_house\",\"bookie\",\"company\",\"enlisted_cars\",\"piggy_bank\",\"pending\",\"loans\",\"unpaid_fees\"],\"properties\":{\"total\":{\"type\":\"integer\",\"format\":\"int64\"},\"wallet\":{\"type\":\"integer\",\"format\":\"int64\"},\"vaults\":{\"type\":\"integer\",\"format\":\"int64\"},\"bank\":{\"type\":\"integer\",\"format\":\"int64\"},\"overseas_bank\":{\"type\":\"integer\",\"format\":\"int64\"},\"points\":{\"type\":\"integer\",\"format\":\"int64\"},\"inventory\":{\"type\":\"integer\",\"format\":\"int64\"},\"display_case\":{\"type\":\"integer\",\"format\":\"int64\"},\"bazaar\":{\"type\":\"integer\",\"format\":\"int64\"},\"item_market\":{\"type\":\"integer\",\"format\":\"int64\"},\"property\":{\"type\":\"integer\",\"format\":\"int64\"},\"stock_market\":{\"type\":\"integer\",\"format\":\"int64\"},\"auction_house\":{\"type\":\"integer\",\"format\":\"int64\"},\"bookie\":{\"type\":\"integer\",\"format\":\"int64\"},\"company\":{\"type\":\"integer\",\"format\":\"int64\"},\"enlisted_cars\":{\"type\":\"integer\",\"format\":\"int64\"},\"piggy_bank\":{\"type\":\"integer\",\"format\":\"int64\"},\"pending\":{\"type\":\"integer\",\"format\":\"int64\"},\"loans\":{\"type\":\"integer\",\"format\":\"int64\"},\"unpaid_fees\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}";
                },
                other: struct {
                    activity: struct {
                        time: i64,
                        streak: struct {
                            best: i64,
                            current: i64,
                            pub const json_schema = "{\"required\":[\"best\",\"current\"],\"properties\":{\"best\":{\"type\":\"integer\",\"format\":\"int32\"},\"current\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                        },
                        pub const json_schema = "{\"required\":[\"time\",\"streak\"],\"properties\":{\"time\":{\"description\":\"Time played in seconds\",\"type\":\"integer\",\"format\":\"int32\"},\"streak\":{\"required\":[\"best\",\"current\"],\"properties\":{\"best\":{\"type\":\"integer\",\"format\":\"int32\"},\"current\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}},\"type\":\"object\"}";
                    },
                    awards: i64,
                    merits_bought: i64,
                    refills: struct {
                        energy: i64,
                        nerve: i64,
                        token: i64,
                        pub const json_schema = "{\"required\":[\"energy\",\"nerve\",\"token\"],\"properties\":{\"energy\":{\"type\":\"integer\",\"format\":\"int32\"},\"nerve\":{\"type\":\"integer\",\"format\":\"int32\"},\"token\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                    },
                    donator_days: i64,
                    ranked_war_wins: i64,
                    pub const json_schema = "{\"required\":[\"activity\",\"awards\",\"merits_bought\",\"refills\",\"donator_days\",\"ranked_war_wins\"],\"properties\":{\"activity\":{\"required\":[\"time\",\"streak\"],\"properties\":{\"time\":{\"description\":\"Time played in seconds\",\"type\":\"integer\",\"format\":\"int32\"},\"streak\":{\"required\":[\"best\",\"current\"],\"properties\":{\"best\":{\"type\":\"integer\",\"format\":\"int32\"},\"current\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}},\"type\":\"object\"},\"awards\":{\"type\":\"integer\",\"format\":\"int32\"},\"merits_bought\":{\"type\":\"integer\",\"format\":\"int32\"},\"refills\":{\"required\":[\"energy\",\"nerve\",\"token\"],\"properties\":{\"energy\":{\"type\":\"integer\",\"format\":\"int32\"},\"nerve\":{\"type\":\"integer\",\"format\":\"int32\"},\"token\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"donator_days\":{\"type\":\"integer\",\"format\":\"int32\"},\"ranked_war_wins\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                },
                pub const json_schema = "{\"properties\":{\"attacking\":{\"required\":[\"attacks\",\"defends\",\"elo\",\"unarmored_wins\",\"highest_level_beaten\",\"escapes\",\"killstreak\",\"hits\",\"damage\",\"networth\",\"ammunition\",\"faction\"],\"properties\":{\"attacks\":{\"required\":[\"won\",\"lost\",\"stalemate\",\"assist\",\"stealth\"],\"properties\":{\"won\":{\"type\":\"integer\",\"format\":\"int32\"},\"lost\":{\"type\":\"integer\",\"format\":\"int32\"},\"stalemate\":{\"type\":\"integer\",\"format\":\"int32\"},\"assist\":{\"type\":\"integer\",\"format\":\"int32\"},\"stealth\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"defends\":{\"required\":[\"won\",\"lost\",\"stalemate\",\"total\"],\"properties\":{\"won\":{\"type\":\"integer\",\"format\":\"int32\"},\"lost\":{\"type\":\"integer\",\"format\":\"int32\"},\"stalemate\":{\"type\":\"integer\",\"format\":\"int32\"},\"total\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"elo\":{\"type\":\"integer\",\"format\":\"int32\"},\"unarmored_wins\":{\"type\":\"integer\",\"format\":\"int32\"},\"highest_level_beaten\":{\"type\":\"integer\",\"format\":\"int32\"},\"escapes\":{\"required\":[\"player\",\"foes\"],\"properties\":{\"player\":{\"type\":\"integer\",\"format\":\"int32\"},\"foes\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"killstreak\":{\"required\":[\"best\",\"current\"],\"properties\":{\"best\":{\"type\":\"integer\",\"format\":\"int32\"},\"current\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"hits\":{\"required\":[\"success\",\"miss\",\"critical\",\"one_hit_kills\"],\"properties\":{\"success\":{\"type\":\"integer\",\"format\":\"int32\"},\"miss\":{\"type\":\"integer\",\"format\":\"int32\"},\"critical\":{\"type\":\"integer\",\"format\":\"int32\"},\"one_hit_kills\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"damage\":{\"required\":[\"total\",\"best\"],\"properties\":{\"total\":{\"type\":\"integer\",\"format\":\"int64\"},\"best\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"networth\":{\"required\":[\"money_mugged\",\"largest_mug\",\"items_looted\"],\"properties\":{\"money_mugged\":{\"type\":\"integer\",\"format\":\"int64\"},\"largest_mug\":{\"type\":\"integer\",\"format\":\"int64\"},\"items_looted\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"ammunition\":{\"required\":[\"total\",\"special\",\"hollow_point\",\"tracer\",\"piercing\",\"incendiary\"],\"properties\":{\"total\":{\"type\":\"integer\",\"format\":\"int32\"},\"special\":{\"type\":\"integer\",\"format\":\"int32\"},\"hollow_point\":{\"type\":\"integer\",\"format\":\"int32\"},\"tracer\":{\"type\":\"integer\",\"format\":\"int32\"},\"piercing\":{\"type\":\"integer\",\"format\":\"int32\"},\"incendiary\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"faction\":{\"required\":[\"respect\",\"retaliations\",\"ranked_war_hits\",\"raid_hits\",\"territory\"],\"properties\":{\"respect\":{\"type\":\"integer\",\"format\":\"int32\"},\"retaliations\":{\"type\":\"integer\",\"format\":\"int32\"},\"ranked_war_hits\":{\"type\":\"integer\",\"format\":\"int32\"},\"raid_hits\":{\"type\":\"integer\",\"format\":\"int32\"},\"territory\":{\"required\":[\"wall_joins\",\"wall_clears\",\"wall_time\"],\"properties\":{\"wall_joins\":{\"type\":\"integer\",\"format\":\"int32\"},\"wall_clears\":{\"type\":\"integer\",\"format\":\"int32\"},\"wall_time\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}},\"type\":\"object\"}},\"type\":\"object\"},\"battle_stats\":{\"required\":[\"strength\",\"defense\",\"speed\",\"dexterity\",\"total\"],\"properties\":{\"strength\":{\"type\":\"integer\",\"format\":\"int64\"},\"defense\":{\"type\":\"integer\",\"format\":\"int64\"},\"speed\":{\"type\":\"integer\",\"format\":\"int64\"},\"dexterity\":{\"type\":\"integer\",\"format\":\"int64\"},\"total\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"},\"jobs\":{\"required\":[\"job_points_used\",\"trains_received\",\"stats\"],\"properties\":{\"job_points_used\":{\"type\":\"integer\",\"format\":\"int32\"},\"trains_received\":{\"type\":\"integer\",\"format\":\"int32\"},\"stats\":{\"required\":[\"manual\",\"intelligence\",\"endurance\",\"total\"],\"properties\":{\"manual\":{\"type\":\"integer\",\"format\":\"int32\"},\"intelligence\":{\"type\":\"integer\",\"format\":\"int32\"},\"endurance\":{\"type\":\"integer\",\"format\":\"int32\"},\"total\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}},\"type\":\"object\"},\"trading\":{\"required\":[\"items\",\"trades\",\"points\",\"bazaar\"],\"properties\":{\"items\":{\"required\":[\"bought\",\"sent\",\"auctions\"],\"properties\":{\"bought\":{\"required\":[\"market\",\"shops\"],\"properties\":{\"market\":{\"type\":\"integer\",\"format\":\"int32\"},\"shops\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"auctions\":{\"required\":[\"won\",\"sold\"],\"properties\":{\"won\":{\"type\":\"integer\",\"format\":\"int32\"},\"sold\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"sent\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"trades\":{\"type\":\"integer\",\"format\":\"int32\"},\"points\":{\"required\":[\"bought\",\"sold\"],\"properties\":{\"bought\":{\"type\":\"integer\",\"format\":\"int32\"},\"sold\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"bazaar\":{\"required\":[\"customers\",\"sales\",\"profit\"],\"properties\":{\"customers\":{\"type\":\"integer\",\"format\":\"int32\"},\"sales\":{\"type\":\"integer\",\"format\":\"int32\"},\"profit\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"},\"item_market\":{\"required\":[\"customers\",\"sales\",\"revenue\",\"fees\"],\"properties\":{\"customers\":{\"type\":\"integer\",\"format\":\"int32\"},\"sales\":{\"type\":\"integer\",\"format\":\"int32\"},\"revenue\":{\"type\":\"integer\",\"format\":\"int64\"},\"fees\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}},\"type\":\"object\"},\"jail\":{\"required\":[\"times_jailed\",\"busts\",\"bails\"],\"properties\":{\"times_jailed\":{\"type\":\"integer\",\"format\":\"int32\"},\"busts\":{\"required\":[\"success\",\"fails\"],\"properties\":{\"success\":{\"type\":\"integer\",\"format\":\"int32\"},\"fails\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"bails\":{\"required\":[\"amount\",\"fees\"],\"properties\":{\"amount\":{\"type\":\"integer\",\"format\":\"int32\"},\"fees\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}},\"type\":\"object\"},\"hospital\":{\"required\":[\"times_hospitalized\",\"medical_items_used\",\"blood_withdrawn\",\"reviving\"],\"properties\":{\"times_hospitalized\":{\"type\":\"integer\",\"format\":\"int32\"},\"medical_items_used\":{\"type\":\"integer\",\"format\":\"int32\"},\"blood_withdrawn\":{\"type\":\"integer\",\"format\":\"int32\"},\"reviving\":{\"required\":[\"skill\",\"revives\",\"revives_received\"],\"properties\":{\"skill\":{\"type\":\"integer\",\"format\":\"int32\"},\"revives\":{\"type\":\"integer\",\"format\":\"int32\"},\"revives_received\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}},\"type\":\"object\"},\"finishing_hits\":{\"required\":[\"heavy_artillery\",\"machine_guns\",\"rifles\",\"sub_machine_guns\",\"shotguns\",\"pistols\",\"temporary\",\"piercing\",\"slashing\",\"clubbing\",\"mechanical\",\"hand_to_hand\"],\"properties\":{\"heavy_artillery\":{\"type\":\"integer\",\"format\":\"int32\"},\"machine_guns\":{\"type\":\"integer\",\"format\":\"int32\"},\"rifles\":{\"type\":\"integer\",\"format\":\"int32\"},\"sub_machine_guns\":{\"type\":\"integer\",\"format\":\"int32\"},\"shotguns\":{\"type\":\"integer\",\"format\":\"int32\"},\"pistols\":{\"type\":\"integer\",\"format\":\"int32\"},\"temporary\":{\"type\":\"integer\",\"format\":\"int32\"},\"piercing\":{\"type\":\"integer\",\"format\":\"int32\"},\"slashing\":{\"type\":\"integer\",\"format\":\"int32\"},\"clubbing\":{\"type\":\"integer\",\"format\":\"int32\"},\"mechanical\":{\"type\":\"integer\",\"format\":\"int32\"},\"hand_to_hand\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"communication\":{\"required\":[\"mails_sent\",\"classified_ads\",\"personals\"],\"properties\":{\"mails_sent\":{\"required\":[\"total\",\"friends\",\"faction\",\"colleagues\",\"spouse\"],\"properties\":{\"total\":{\"type\":\"integer\",\"format\":\"int32\"},\"friends\":{\"type\":\"integer\",\"format\":\"int32\"},\"faction\":{\"type\":\"integer\",\"format\":\"int32\"},\"colleagues\":{\"type\":\"integer\",\"format\":\"int32\"},\"spouse\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"classified_ads\":{\"type\":\"integer\",\"format\":\"int32\"},\"personals\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"crimes\":{\"oneOf\":[{\"$ref\":\"#/components/schemas/PersonalStatsCrimesV1\"},{\"$ref\":\"#/components/schemas/PersonalStatsCrimesV2\"}]},\"bounties\":{\"required\":[\"placed\",\"collected\",\"received\"],\"properties\":{\"placed\":{\"required\":[\"amount\",\"value\"],\"properties\":{\"amount\":{\"type\":\"integer\",\"format\":\"int32\"},\"value\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"},\"collected\":{\"required\":[\"amount\",\"value\"],\"properties\":{\"amount\":{\"type\":\"integer\",\"format\":\"int32\"},\"value\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"},\"received\":{\"required\":[\"amount\",\"value\"],\"properties\":{\"amount\":{\"type\":\"integer\",\"format\":\"int32\"},\"value\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}},\"type\":\"object\"},\"investments\":{\"required\":[\"bank\",\"stocks\"],\"properties\":{\"bank\":{\"required\":[\"total\",\"profit\",\"current\",\"time_remaining\"],\"properties\":{\"total\":{\"type\":\"integer\",\"format\":\"int64\"},\"profit\":{\"type\":\"integer\",\"format\":\"int64\"},\"current\":{\"type\":\"integer\",\"format\":\"int64\"},\"time_remaining\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"stocks\":{\"required\":[\"profits\",\"losses\",\"fees\",\"net_profits\",\"payouts\"],\"properties\":{\"profits\":{\"type\":\"integer\",\"format\":\"int64\"},\"losses\":{\"type\":\"integer\",\"format\":\"int64\"},\"fees\":{\"type\":\"integer\",\"format\":\"int64\"},\"net_profits\":{\"type\":\"integer\",\"format\":\"int64\"},\"payouts\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}},\"type\":\"object\"},\"items\":{\"required\":[\"found\",\"trashed\",\"used\",\"viruses_coded\"],\"properties\":{\"found\":{\"required\":[\"city\",\"dump\",\"easter_eggs\"],\"properties\":{\"city\":{\"type\":\"integer\",\"format\":\"int32\"},\"dump\":{\"type\":\"integer\",\"format\":\"int32\"},\"easter_eggs\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"trashed\":{\"type\":\"integer\",\"format\":\"int32\"},\"used\":{\"required\":[\"books\",\"boosters\",\"consumables\",\"candy\",\"alcohol\",\"energy_drinks\",\"stat_enhancers\",\"easter_eggs\"],\"properties\":{\"books\":{\"type\":\"integer\",\"format\":\"int32\"},\"boosters\":{\"type\":\"integer\",\"format\":\"int32\"},\"consumables\":{\"type\":\"integer\",\"format\":\"int32\"},\"candy\":{\"type\":\"integer\",\"format\":\"int32\"},\"alcohol\":{\"type\":\"integer\",\"format\":\"int32\"},\"energy_drinks\":{\"type\":\"integer\",\"format\":\"int32\"},\"stat_enhancers\":{\"type\":\"integer\",\"format\":\"int32\"},\"easter_eggs\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"viruses_coded\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"travel\":{\"required\":[\"total\",\"time_spent\",\"items_bought\",\"hunting\",\"attacks_won\",\"defends_lost\",\"argentina\",\"canada\",\"cayman_islands\",\"china\",\"hawaii\",\"japan\",\"mexico\",\"united_arab_emirates\",\"united_kingdom\",\"south_africa\",\"switzerland\"],\"properties\":{\"total\":{\"type\":\"integer\",\"format\":\"int32\"},\"time_spent\":{\"type\":\"integer\",\"format\":\"int32\"},\"items_bought\":{\"type\":\"integer\",\"format\":\"int32\"},\"hunting\":{\"required\":[\"skill\"],\"properties\":{\"skill\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"attacks_won\":{\"type\":\"integer\",\"format\":\"int32\"},\"defends_lost\":{\"type\":\"integer\",\"format\":\"int32\"},\"argentina\":{\"type\":\"integer\",\"format\":\"int32\"},\"canada\":{\"type\":\"integer\",\"format\":\"int32\"},\"cayman_islands\":{\"type\":\"integer\",\"format\":\"int32\"},\"china\":{\"type\":\"integer\",\"format\":\"int32\"},\"hawaii\":{\"type\":\"integer\",\"format\":\"int32\"},\"japan\":{\"type\":\"integer\",\"format\":\"int32\"},\"mexico\":{\"type\":\"integer\",\"format\":\"int32\"},\"united_arab_emirates\":{\"type\":\"integer\",\"format\":\"int32\"},\"united_kingdom\":{\"type\":\"integer\",\"format\":\"int32\"},\"south_africa\":{\"type\":\"integer\",\"format\":\"int32\"},\"switzerland\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"drugs\":{\"required\":[\"cannabis\",\"ecstasy\",\"ketamine\",\"lsd\",\"opium\",\"pcp\",\"shrooms\",\"speed\",\"vicodin\",\"xanax\",\"total\",\"overdoses\",\"rehabilitations\"],\"properties\":{\"cannabis\":{\"type\":\"integer\",\"format\":\"int32\"},\"ecstasy\":{\"type\":\"integer\",\"format\":\"int32\"},\"ketamine\":{\"type\":\"integer\",\"format\":\"int32\"},\"lsd\":{\"type\":\"integer\",\"format\":\"int32\"},\"opium\":{\"type\":\"integer\",\"format\":\"int32\"},\"pcp\":{\"type\":\"integer\",\"format\":\"int32\"},\"shrooms\":{\"type\":\"integer\",\"format\":\"int32\"},\"speed\":{\"type\":\"integer\",\"format\":\"int32\"},\"vicodin\":{\"type\":\"integer\",\"format\":\"int32\"},\"xanax\":{\"type\":\"integer\",\"format\":\"int32\"},\"total\":{\"type\":\"integer\",\"format\":\"int32\"},\"overdoses\":{\"type\":\"integer\",\"format\":\"int32\"},\"rehabilitations\":{\"required\":[\"amount\",\"fees\"],\"properties\":{\"amount\":{\"type\":\"integer\",\"format\":\"int32\"},\"fees\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}},\"type\":\"object\"},\"missions\":{\"required\":[\"missions\",\"contracts\",\"credits\"],\"properties\":{\"missions\":{\"type\":\"integer\",\"format\":\"int32\"},\"contracts\":{\"required\":[\"total\",\"duke\"],\"properties\":{\"total\":{\"type\":\"integer\",\"format\":\"int32\"},\"duke\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"credits\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"racing\":{\"required\":[\"skill\",\"points\",\"races\"],\"properties\":{\"skill\":{\"type\":\"integer\",\"format\":\"int32\"},\"points\":{\"type\":\"integer\",\"format\":\"int32\"},\"races\":{\"required\":[\"entered\",\"won\"],\"properties\":{\"entered\":{\"type\":\"integer\",\"format\":\"int32\"},\"won\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}},\"type\":\"object\"},\"networth\":{\"required\":[\"total\",\"wallet\",\"vaults\",\"bank\",\"overseas_bank\",\"points\",\"inventory\",\"display_case\",\"bazaar\",\"item_market\",\"property\",\"stock_market\",\"auction_house\",\"bookie\",\"company\",\"enlisted_cars\",\"piggy_bank\",\"pending\",\"loans\",\"unpaid_fees\"],\"properties\":{\"total\":{\"type\":\"integer\",\"format\":\"int64\"},\"wallet\":{\"type\":\"integer\",\"format\":\"int64\"},\"vaults\":{\"type\":\"integer\",\"format\":\"int64\"},\"bank\":{\"type\":\"integer\",\"format\":\"int64\"},\"overseas_bank\":{\"type\":\"integer\",\"format\":\"int64\"},\"points\":{\"type\":\"integer\",\"format\":\"int64\"},\"inventory\":{\"type\":\"integer\",\"format\":\"int64\"},\"display_case\":{\"type\":\"integer\",\"format\":\"int64\"},\"bazaar\":{\"type\":\"integer\",\"format\":\"int64\"},\"item_market\":{\"type\":\"integer\",\"format\":\"int64\"},\"property\":{\"type\":\"integer\",\"format\":\"int64\"},\"stock_market\":{\"type\":\"integer\",\"format\":\"int64\"},\"auction_house\":{\"type\":\"integer\",\"format\":\"int64\"},\"bookie\":{\"type\":\"integer\",\"format\":\"int64\"},\"company\":{\"type\":\"integer\",\"format\":\"int64\"},\"enlisted_cars\":{\"type\":\"integer\",\"format\":\"int64\"},\"piggy_bank\":{\"type\":\"integer\",\"format\":\"int64\"},\"pending\":{\"type\":\"integer\",\"format\":\"int64\"},\"loans\":{\"type\":\"integer\",\"format\":\"int64\"},\"unpaid_fees\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"},\"other\":{\"required\":[\"activity\",\"awards\",\"merits_bought\",\"refills\",\"donator_days\",\"ranked_war_wins\"],\"properties\":{\"activity\":{\"required\":[\"time\",\"streak\"],\"properties\":{\"time\":{\"description\":\"Time played in seconds\",\"type\":\"integer\",\"format\":\"int32\"},\"streak\":{\"required\":[\"best\",\"current\"],\"properties\":{\"best\":{\"type\":\"integer\",\"format\":\"int32\"},\"current\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}},\"type\":\"object\"},\"awards\":{\"type\":\"integer\",\"format\":\"int32\"},\"merits_bought\":{\"type\":\"integer\",\"format\":\"int32\"},\"refills\":{\"required\":[\"energy\",\"nerve\",\"token\"],\"properties\":{\"energy\":{\"type\":\"integer\",\"format\":\"int32\"},\"nerve\":{\"type\":\"integer\",\"format\":\"int32\"},\"token\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"donator_days\":{\"type\":\"integer\",\"format\":\"int32\"},\"ranked_war_wins\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}},\"required\":[\"attacking\",\"battle_stats\",\"jobs\",\"trading\",\"jail\",\"hospital\",\"finishing_hits\",\"communication\",\"crimes\",\"bounties\",\"investments\",\"items\",\"travel\",\"drugs\",\"missions\",\"racing\",\"networth\",\"other\"]}";
            },
            v1: struct {
                attacking: struct {
                    attacks: struct {
                        won: i64,
                        lost: i64,
                        stalemate: i64,
                        assist: i64,
                        stealth: i64,
                        pub const json_schema = "{\"required\":[\"won\",\"lost\",\"stalemate\",\"assist\",\"stealth\"],\"properties\":{\"won\":{\"type\":\"integer\",\"format\":\"int32\"},\"lost\":{\"type\":\"integer\",\"format\":\"int32\"},\"stalemate\":{\"type\":\"integer\",\"format\":\"int32\"},\"assist\":{\"type\":\"integer\",\"format\":\"int32\"},\"stealth\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                    },
                    defends: struct {
                        won: i64,
                        lost: i64,
                        stalemate: i64,
                        total: i64,
                        pub const json_schema = "{\"required\":[\"won\",\"lost\",\"stalemate\",\"total\"],\"properties\":{\"won\":{\"type\":\"integer\",\"format\":\"int32\"},\"lost\":{\"type\":\"integer\",\"format\":\"int32\"},\"stalemate\":{\"type\":\"integer\",\"format\":\"int32\"},\"total\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                    },
                    elo: i64,
                    unarmored_wins: i64,
                    highest_level_beaten: i64,
                    escapes: struct {
                        player: i64,
                        foes: i64,
                        pub const json_schema = "{\"required\":[\"player\",\"foes\"],\"properties\":{\"player\":{\"type\":\"integer\",\"format\":\"int32\"},\"foes\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                    },
                    killstreak: struct {
                        best: i64,
                        pub const json_schema = "{\"required\":[\"best\"],\"properties\":{\"best\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                    },
                    hits: struct {
                        success: i64,
                        miss: i64,
                        critical: i64,
                        one_hit_kills: i64,
                        pub const json_schema = "{\"required\":[\"success\",\"miss\",\"critical\",\"one_hit_kills\"],\"properties\":{\"success\":{\"type\":\"integer\",\"format\":\"int32\"},\"miss\":{\"type\":\"integer\",\"format\":\"int32\"},\"critical\":{\"type\":\"integer\",\"format\":\"int32\"},\"one_hit_kills\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                    },
                    damage: struct {
                        total: i64,
                        best: i64,
                        pub const json_schema = "{\"required\":[\"total\",\"best\"],\"properties\":{\"total\":{\"type\":\"integer\",\"format\":\"int64\"},\"best\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                    },
                    networth: struct {
                        money_mugged: i64,
                        largest_mug: i64,
                        items_looted: i64,
                        pub const json_schema = "{\"required\":[\"money_mugged\",\"largest_mug\",\"items_looted\"],\"properties\":{\"money_mugged\":{\"type\":\"integer\",\"format\":\"int64\"},\"largest_mug\":{\"type\":\"integer\",\"format\":\"int64\"},\"items_looted\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                    },
                    ammunition: struct {
                        total: i64,
                        special: i64,
                        hollow_point: i64,
                        tracer: i64,
                        piercing: i64,
                        incendiary: i64,
                        pub const json_schema = "{\"required\":[\"total\",\"special\",\"hollow_point\",\"tracer\",\"piercing\",\"incendiary\"],\"properties\":{\"total\":{\"type\":\"integer\",\"format\":\"int32\"},\"special\":{\"type\":\"integer\",\"format\":\"int32\"},\"hollow_point\":{\"type\":\"integer\",\"format\":\"int32\"},\"tracer\":{\"type\":\"integer\",\"format\":\"int32\"},\"piercing\":{\"type\":\"integer\",\"format\":\"int32\"},\"incendiary\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                    },
                    faction: struct {
                        respect: i64,
                        retaliations: i64,
                        ranked_war_hits: i64,
                        raid_hits: i64,
                        territory: struct {
                            wall_joins: i64,
                            wall_clears: i64,
                            wall_time: i64,
                            pub const json_schema = "{\"required\":[\"wall_joins\",\"wall_clears\",\"wall_time\"],\"properties\":{\"wall_joins\":{\"type\":\"integer\",\"format\":\"int32\"},\"wall_clears\":{\"type\":\"integer\",\"format\":\"int32\"},\"wall_time\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                        },
                        pub const json_schema = "{\"required\":[\"respect\",\"retaliations\",\"ranked_war_hits\",\"raid_hits\",\"territory\"],\"properties\":{\"respect\":{\"type\":\"integer\",\"format\":\"int32\"},\"retaliations\":{\"type\":\"integer\",\"format\":\"int32\"},\"ranked_war_hits\":{\"type\":\"integer\",\"format\":\"int32\"},\"raid_hits\":{\"type\":\"integer\",\"format\":\"int32\"},\"territory\":{\"required\":[\"wall_joins\",\"wall_clears\",\"wall_time\"],\"properties\":{\"wall_joins\":{\"type\":\"integer\",\"format\":\"int32\"},\"wall_clears\":{\"type\":\"integer\",\"format\":\"int32\"},\"wall_time\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}},\"type\":\"object\"}";
                    },
                    pub const json_schema = "{\"required\":[\"attacks\",\"defends\",\"elo\",\"unarmored_wins\",\"highest_level_beaten\",\"escapes\",\"killstreak\",\"hits\",\"damage\",\"networth\",\"ammunition\",\"faction\"],\"properties\":{\"attacks\":{\"required\":[\"won\",\"lost\",\"stalemate\",\"assist\",\"stealth\"],\"properties\":{\"won\":{\"type\":\"integer\",\"format\":\"int32\"},\"lost\":{\"type\":\"integer\",\"format\":\"int32\"},\"stalemate\":{\"type\":\"integer\",\"format\":\"int32\"},\"assist\":{\"type\":\"integer\",\"format\":\"int32\"},\"stealth\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"defends\":{\"required\":[\"won\",\"lost\",\"stalemate\",\"total\"],\"properties\":{\"won\":{\"type\":\"integer\",\"format\":\"int32\"},\"lost\":{\"type\":\"integer\",\"format\":\"int32\"},\"stalemate\":{\"type\":\"integer\",\"format\":\"int32\"},\"total\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"elo\":{\"type\":\"integer\",\"format\":\"int32\"},\"unarmored_wins\":{\"type\":\"integer\",\"format\":\"int32\"},\"highest_level_beaten\":{\"type\":\"integer\",\"format\":\"int32\"},\"escapes\":{\"required\":[\"player\",\"foes\"],\"properties\":{\"player\":{\"type\":\"integer\",\"format\":\"int32\"},\"foes\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"killstreak\":{\"required\":[\"best\"],\"properties\":{\"best\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"hits\":{\"required\":[\"success\",\"miss\",\"critical\",\"one_hit_kills\"],\"properties\":{\"success\":{\"type\":\"integer\",\"format\":\"int32\"},\"miss\":{\"type\":\"integer\",\"format\":\"int32\"},\"critical\":{\"type\":\"integer\",\"format\":\"int32\"},\"one_hit_kills\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"damage\":{\"required\":[\"total\",\"best\"],\"properties\":{\"total\":{\"type\":\"integer\",\"format\":\"int64\"},\"best\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"networth\":{\"required\":[\"money_mugged\",\"largest_mug\",\"items_looted\"],\"properties\":{\"money_mugged\":{\"type\":\"integer\",\"format\":\"int64\"},\"largest_mug\":{\"type\":\"integer\",\"format\":\"int64\"},\"items_looted\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"ammunition\":{\"required\":[\"total\",\"special\",\"hollow_point\",\"tracer\",\"piercing\",\"incendiary\"],\"properties\":{\"total\":{\"type\":\"integer\",\"format\":\"int32\"},\"special\":{\"type\":\"integer\",\"format\":\"int32\"},\"hollow_point\":{\"type\":\"integer\",\"format\":\"int32\"},\"tracer\":{\"type\":\"integer\",\"format\":\"int32\"},\"piercing\":{\"type\":\"integer\",\"format\":\"int32\"},\"incendiary\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"faction\":{\"required\":[\"respect\",\"retaliations\",\"ranked_war_hits\",\"raid_hits\",\"territory\"],\"properties\":{\"respect\":{\"type\":\"integer\",\"format\":\"int32\"},\"retaliations\":{\"type\":\"integer\",\"format\":\"int32\"},\"ranked_war_hits\":{\"type\":\"integer\",\"format\":\"int32\"},\"raid_hits\":{\"type\":\"integer\",\"format\":\"int32\"},\"territory\":{\"required\":[\"wall_joins\",\"wall_clears\",\"wall_time\"],\"properties\":{\"wall_joins\":{\"type\":\"integer\",\"format\":\"int32\"},\"wall_clears\":{\"type\":\"integer\",\"format\":\"int32\"},\"wall_time\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}},\"type\":\"object\"}},\"type\":\"object\"}";
                },
                jobs: struct {
                    job_points_used: i64,
                    trains_received: i64,
                    pub const json_schema = "{\"required\":[\"job_points_used\",\"trains_received\"],\"properties\":{\"job_points_used\":{\"type\":\"integer\",\"format\":\"int32\"},\"trains_received\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                },
                trading: struct {
                    items: struct {
                        bought: struct {
                            market: i64,
                            shops: i64,
                            pub const json_schema = "{\"required\":[\"market\",\"shops\"],\"properties\":{\"market\":{\"type\":\"integer\",\"format\":\"int32\"},\"shops\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                        },
                        auctions: struct {
                            won: i64,
                            sold: i64,
                            pub const json_schema = "{\"required\":[\"won\",\"sold\"],\"properties\":{\"won\":{\"type\":\"integer\",\"format\":\"int32\"},\"sold\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                        },
                        sent: i64,
                        pub const json_schema = "{\"required\":[\"bought\",\"sent\",\"auctions\"],\"properties\":{\"bought\":{\"required\":[\"market\",\"shops\"],\"properties\":{\"market\":{\"type\":\"integer\",\"format\":\"int32\"},\"shops\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"auctions\":{\"required\":[\"won\",\"sold\"],\"properties\":{\"won\":{\"type\":\"integer\",\"format\":\"int32\"},\"sold\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"sent\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                    },
                    trades: i64,
                    points: struct {
                        bought: i64,
                        sold: i64,
                        pub const json_schema = "{\"required\":[\"bought\",\"sold\"],\"properties\":{\"bought\":{\"type\":\"integer\",\"format\":\"int32\"},\"sold\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                    },
                    bazaar: struct {
                        customers: i64,
                        sales: i64,
                        profit: i64,
                        pub const json_schema = "{\"required\":[\"customers\",\"sales\",\"profit\"],\"properties\":{\"customers\":{\"type\":\"integer\",\"format\":\"int32\"},\"sales\":{\"type\":\"integer\",\"format\":\"int32\"},\"profit\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}";
                    },
                    item_market: model.Presence(struct {
                        customers: i64,
                        sales: i64,
                        revenue: i64,
                        fees: i64,
                        pub const json_schema = "{\"required\":[\"customers\",\"sales\",\"revenue\",\"fees\"],\"properties\":{\"customers\":{\"type\":\"integer\",\"format\":\"int32\"},\"sales\":{\"type\":\"integer\",\"format\":\"int32\"},\"revenue\":{\"type\":\"integer\",\"format\":\"int64\"},\"fees\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}";
                    }) = .absent,
                    pub const json_schema = "{\"required\":[\"items\",\"trades\",\"points\",\"bazaar\"],\"properties\":{\"items\":{\"required\":[\"bought\",\"sent\",\"auctions\"],\"properties\":{\"bought\":{\"required\":[\"market\",\"shops\"],\"properties\":{\"market\":{\"type\":\"integer\",\"format\":\"int32\"},\"shops\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"auctions\":{\"required\":[\"won\",\"sold\"],\"properties\":{\"won\":{\"type\":\"integer\",\"format\":\"int32\"},\"sold\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"sent\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"trades\":{\"type\":\"integer\",\"format\":\"int32\"},\"points\":{\"required\":[\"bought\",\"sold\"],\"properties\":{\"bought\":{\"type\":\"integer\",\"format\":\"int32\"},\"sold\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"bazaar\":{\"required\":[\"customers\",\"sales\",\"profit\"],\"properties\":{\"customers\":{\"type\":\"integer\",\"format\":\"int32\"},\"sales\":{\"type\":\"integer\",\"format\":\"int32\"},\"profit\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"},\"item_market\":{\"required\":[\"customers\",\"sales\",\"revenue\",\"fees\"],\"properties\":{\"customers\":{\"type\":\"integer\",\"format\":\"int32\"},\"sales\":{\"type\":\"integer\",\"format\":\"int32\"},\"revenue\":{\"type\":\"integer\",\"format\":\"int64\"},\"fees\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}},\"type\":\"object\"}";
                },
                jail: struct {
                    times_jailed: i64,
                    busts: struct {
                        success: i64,
                        fails: i64,
                        pub const json_schema = "{\"required\":[\"success\",\"fails\"],\"properties\":{\"success\":{\"type\":\"integer\",\"format\":\"int32\"},\"fails\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                    },
                    bails: struct {
                        amount: i64,
                        fees: i64,
                        pub const json_schema = "{\"required\":[\"amount\",\"fees\"],\"properties\":{\"amount\":{\"type\":\"integer\",\"format\":\"int32\"},\"fees\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}";
                    },
                    pub const json_schema = "{\"required\":[\"times_jailed\",\"busts\",\"bails\"],\"properties\":{\"times_jailed\":{\"type\":\"integer\",\"format\":\"int32\"},\"busts\":{\"required\":[\"success\",\"fails\"],\"properties\":{\"success\":{\"type\":\"integer\",\"format\":\"int32\"},\"fails\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"bails\":{\"required\":[\"amount\",\"fees\"],\"properties\":{\"amount\":{\"type\":\"integer\",\"format\":\"int32\"},\"fees\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}},\"type\":\"object\"}";
                },
                hospital: struct {
                    times_hospitalized: i64,
                    medical_items_used: i64,
                    blood_withdrawn: i64,
                    reviving: struct {
                        skill: i64,
                        revives: i64,
                        revives_received: i64,
                        pub const json_schema = "{\"required\":[\"skill\",\"revives\",\"revives_received\"],\"properties\":{\"skill\":{\"type\":\"integer\",\"format\":\"int32\"},\"revives\":{\"type\":\"integer\",\"format\":\"int32\"},\"revives_received\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                    },
                    pub const json_schema = "{\"required\":[\"times_hospitalized\",\"medical_items_used\",\"blood_withdrawn\",\"reviving\"],\"properties\":{\"times_hospitalized\":{\"type\":\"integer\",\"format\":\"int32\"},\"medical_items_used\":{\"type\":\"integer\",\"format\":\"int32\"},\"blood_withdrawn\":{\"type\":\"integer\",\"format\":\"int32\"},\"reviving\":{\"required\":[\"skill\",\"revives\",\"revives_received\"],\"properties\":{\"skill\":{\"type\":\"integer\",\"format\":\"int32\"},\"revives\":{\"type\":\"integer\",\"format\":\"int32\"},\"revives_received\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}},\"type\":\"object\"}";
                },
                finishing_hits: struct {
                    heavy_artillery: i64,
                    machine_guns: i64,
                    rifles: i64,
                    sub_machine_guns: i64,
                    shotguns: i64,
                    pistols: i64,
                    temporary: i64,
                    piercing: i64,
                    slashing: i64,
                    clubbing: i64,
                    mechanical: i64,
                    hand_to_hand: i64,
                    pub const json_schema = "{\"required\":[\"heavy_artillery\",\"machine_guns\",\"rifles\",\"sub_machine_guns\",\"shotguns\",\"pistols\",\"temporary\",\"piercing\",\"slashing\",\"clubbing\",\"mechanical\",\"hand_to_hand\"],\"properties\":{\"heavy_artillery\":{\"type\":\"integer\",\"format\":\"int32\"},\"machine_guns\":{\"type\":\"integer\",\"format\":\"int32\"},\"rifles\":{\"type\":\"integer\",\"format\":\"int32\"},\"sub_machine_guns\":{\"type\":\"integer\",\"format\":\"int32\"},\"shotguns\":{\"type\":\"integer\",\"format\":\"int32\"},\"pistols\":{\"type\":\"integer\",\"format\":\"int32\"},\"temporary\":{\"type\":\"integer\",\"format\":\"int32\"},\"piercing\":{\"type\":\"integer\",\"format\":\"int32\"},\"slashing\":{\"type\":\"integer\",\"format\":\"int32\"},\"clubbing\":{\"type\":\"integer\",\"format\":\"int32\"},\"mechanical\":{\"type\":\"integer\",\"format\":\"int32\"},\"hand_to_hand\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                },
                communication: struct {
                    mails_sent: struct {
                        total: i64,
                        friends: i64,
                        faction: i64,
                        colleagues: i64,
                        spouse: i64,
                        pub const json_schema = "{\"required\":[\"total\",\"friends\",\"faction\",\"colleagues\",\"spouse\"],\"properties\":{\"total\":{\"type\":\"integer\",\"format\":\"int32\"},\"friends\":{\"type\":\"integer\",\"format\":\"int32\"},\"faction\":{\"type\":\"integer\",\"format\":\"int32\"},\"colleagues\":{\"type\":\"integer\",\"format\":\"int32\"},\"spouse\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                    },
                    classified_ads: i64,
                    personals: i64,
                    pub const json_schema = "{\"required\":[\"mails_sent\",\"classified_ads\",\"personals\"],\"properties\":{\"mails_sent\":{\"required\":[\"total\",\"friends\",\"faction\",\"colleagues\",\"spouse\"],\"properties\":{\"total\":{\"type\":\"integer\",\"format\":\"int32\"},\"friends\":{\"type\":\"integer\",\"format\":\"int32\"},\"faction\":{\"type\":\"integer\",\"format\":\"int32\"},\"colleagues\":{\"type\":\"integer\",\"format\":\"int32\"},\"spouse\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"classified_ads\":{\"type\":\"integer\",\"format\":\"int32\"},\"personals\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                },
                crimes: union(enum) {
                    v0: PersonalStatsCrimesV1,
                    v1: PersonalStatsCrimesV2,
                },
                bounties: struct {
                    placed: struct {
                        amount: i64,
                        value: i64,
                        pub const json_schema = "{\"required\":[\"amount\",\"value\"],\"properties\":{\"amount\":{\"type\":\"integer\",\"format\":\"int32\"},\"value\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}";
                    },
                    collected: struct {
                        amount: i64,
                        value: i64,
                        pub const json_schema = "{\"required\":[\"amount\",\"value\"],\"properties\":{\"amount\":{\"type\":\"integer\",\"format\":\"int32\"},\"value\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}";
                    },
                    received: struct {
                        amount: i64,
                        value: i64,
                        pub const json_schema = "{\"required\":[\"amount\",\"value\"],\"properties\":{\"amount\":{\"type\":\"integer\",\"format\":\"int32\"},\"value\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}";
                    },
                    pub const json_schema = "{\"required\":[\"placed\",\"collected\",\"received\"],\"properties\":{\"placed\":{\"required\":[\"amount\",\"value\"],\"properties\":{\"amount\":{\"type\":\"integer\",\"format\":\"int32\"},\"value\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"},\"collected\":{\"required\":[\"amount\",\"value\"],\"properties\":{\"amount\":{\"type\":\"integer\",\"format\":\"int32\"},\"value\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"},\"received\":{\"required\":[\"amount\",\"value\"],\"properties\":{\"amount\":{\"type\":\"integer\",\"format\":\"int32\"},\"value\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}},\"type\":\"object\"}";
                },
                items: struct {
                    found: struct {
                        city: i64,
                        dump: i64,
                        easter_eggs: i64,
                        pub const json_schema = "{\"required\":[\"city\",\"dump\",\"easter_eggs\"],\"properties\":{\"city\":{\"type\":\"integer\",\"format\":\"int32\"},\"dump\":{\"type\":\"integer\",\"format\":\"int32\"},\"easter_eggs\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                    },
                    trashed: i64,
                    used: struct {
                        books: i64,
                        boosters: i64,
                        consumables: i64,
                        candy: i64,
                        alcohol: i64,
                        energy_drinks: i64,
                        stat_enhancers: i64,
                        easter_eggs: i64,
                        pub const json_schema = "{\"required\":[\"books\",\"boosters\",\"consumables\",\"candy\",\"alcohol\",\"energy_drinks\",\"stat_enhancers\",\"easter_eggs\"],\"properties\":{\"books\":{\"type\":\"integer\",\"format\":\"int32\"},\"boosters\":{\"type\":\"integer\",\"format\":\"int32\"},\"consumables\":{\"type\":\"integer\",\"format\":\"int32\"},\"candy\":{\"type\":\"integer\",\"format\":\"int32\"},\"alcohol\":{\"type\":\"integer\",\"format\":\"int32\"},\"energy_drinks\":{\"type\":\"integer\",\"format\":\"int32\"},\"stat_enhancers\":{\"type\":\"integer\",\"format\":\"int32\"},\"easter_eggs\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                    },
                    viruses_coded: i64,
                    pub const json_schema = "{\"required\":[\"found\",\"trashed\",\"used\",\"viruses_coded\"],\"properties\":{\"found\":{\"required\":[\"city\",\"dump\",\"easter_eggs\"],\"properties\":{\"city\":{\"type\":\"integer\",\"format\":\"int32\"},\"dump\":{\"type\":\"integer\",\"format\":\"int32\"},\"easter_eggs\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"trashed\":{\"type\":\"integer\",\"format\":\"int32\"},\"used\":{\"required\":[\"books\",\"boosters\",\"consumables\",\"candy\",\"alcohol\",\"energy_drinks\",\"stat_enhancers\",\"easter_eggs\"],\"properties\":{\"books\":{\"type\":\"integer\",\"format\":\"int32\"},\"boosters\":{\"type\":\"integer\",\"format\":\"int32\"},\"consumables\":{\"type\":\"integer\",\"format\":\"int32\"},\"candy\":{\"type\":\"integer\",\"format\":\"int32\"},\"alcohol\":{\"type\":\"integer\",\"format\":\"int32\"},\"energy_drinks\":{\"type\":\"integer\",\"format\":\"int32\"},\"stat_enhancers\":{\"type\":\"integer\",\"format\":\"int32\"},\"easter_eggs\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"viruses_coded\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                },
                travel: struct {
                    total: i64,
                    time_spent: i64,
                    items_bought: i64,
                    hunting: struct {
                        skill: i64,
                        pub const json_schema = "{\"required\":[\"skill\"],\"properties\":{\"skill\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                    },
                    attacks_won: i64,
                    defends_lost: i64,
                    argentina: i64,
                    canada: i64,
                    cayman_islands: i64,
                    china: i64,
                    hawaii: i64,
                    japan: i64,
                    mexico: i64,
                    united_arab_emirates: i64,
                    united_kingdom: i64,
                    south_africa: i64,
                    switzerland: i64,
                    pub const json_schema = "{\"required\":[\"total\",\"time_spent\",\"items_bought\",\"hunting\",\"attacks_won\",\"defends_lost\",\"argentina\",\"canada\",\"cayman_islands\",\"china\",\"hawaii\",\"japan\",\"mexico\",\"united_arab_emirates\",\"united_kingdom\",\"south_africa\",\"switzerland\"],\"properties\":{\"total\":{\"type\":\"integer\",\"format\":\"int32\"},\"time_spent\":{\"type\":\"integer\",\"format\":\"int32\"},\"items_bought\":{\"type\":\"integer\",\"format\":\"int32\"},\"hunting\":{\"required\":[\"skill\"],\"properties\":{\"skill\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"attacks_won\":{\"type\":\"integer\",\"format\":\"int32\"},\"defends_lost\":{\"type\":\"integer\",\"format\":\"int32\"},\"argentina\":{\"type\":\"integer\",\"format\":\"int32\"},\"canada\":{\"type\":\"integer\",\"format\":\"int32\"},\"cayman_islands\":{\"type\":\"integer\",\"format\":\"int32\"},\"china\":{\"type\":\"integer\",\"format\":\"int32\"},\"hawaii\":{\"type\":\"integer\",\"format\":\"int32\"},\"japan\":{\"type\":\"integer\",\"format\":\"int32\"},\"mexico\":{\"type\":\"integer\",\"format\":\"int32\"},\"united_arab_emirates\":{\"type\":\"integer\",\"format\":\"int32\"},\"united_kingdom\":{\"type\":\"integer\",\"format\":\"int32\"},\"south_africa\":{\"type\":\"integer\",\"format\":\"int32\"},\"switzerland\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                },
                drugs: struct {
                    cannabis: i64,
                    ecstasy: i64,
                    ketamine: i64,
                    lsd: i64,
                    opium: i64,
                    pcp: i64,
                    shrooms: i64,
                    speed: i64,
                    vicodin: i64,
                    xanax: i64,
                    total: i64,
                    overdoses: i64,
                    rehabilitations: struct {
                        amount: i64,
                        fees: i64,
                        pub const json_schema = "{\"required\":[\"amount\",\"fees\"],\"properties\":{\"amount\":{\"type\":\"integer\",\"format\":\"int32\"},\"fees\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}";
                    },
                    pub const json_schema = "{\"required\":[\"cannabis\",\"ecstasy\",\"ketamine\",\"lsd\",\"opium\",\"pcp\",\"shrooms\",\"speed\",\"vicodin\",\"xanax\",\"total\",\"overdoses\",\"rehabilitations\"],\"properties\":{\"cannabis\":{\"type\":\"integer\",\"format\":\"int32\"},\"ecstasy\":{\"type\":\"integer\",\"format\":\"int32\"},\"ketamine\":{\"type\":\"integer\",\"format\":\"int32\"},\"lsd\":{\"type\":\"integer\",\"format\":\"int32\"},\"opium\":{\"type\":\"integer\",\"format\":\"int32\"},\"pcp\":{\"type\":\"integer\",\"format\":\"int32\"},\"shrooms\":{\"type\":\"integer\",\"format\":\"int32\"},\"speed\":{\"type\":\"integer\",\"format\":\"int32\"},\"vicodin\":{\"type\":\"integer\",\"format\":\"int32\"},\"xanax\":{\"type\":\"integer\",\"format\":\"int32\"},\"total\":{\"type\":\"integer\",\"format\":\"int32\"},\"overdoses\":{\"type\":\"integer\",\"format\":\"int32\"},\"rehabilitations\":{\"required\":[\"amount\",\"fees\"],\"properties\":{\"amount\":{\"type\":\"integer\",\"format\":\"int32\"},\"fees\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}},\"type\":\"object\"}";
                },
                missions: struct {
                    missions: i64,
                    contracts: struct {
                        total: i64,
                        duke: i64,
                        pub const json_schema = "{\"required\":[\"total\",\"duke\"],\"properties\":{\"total\":{\"type\":\"integer\",\"format\":\"int32\"},\"duke\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                    },
                    credits: i64,
                    pub const json_schema = "{\"required\":[\"missions\",\"contracts\",\"credits\"],\"properties\":{\"missions\":{\"type\":\"integer\",\"format\":\"int32\"},\"contracts\":{\"required\":[\"total\",\"duke\"],\"properties\":{\"total\":{\"type\":\"integer\",\"format\":\"int32\"},\"duke\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"credits\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                },
                racing: struct {
                    skill: i64,
                    points: i64,
                    races: struct {
                        entered: i64,
                        won: i64,
                        pub const json_schema = "{\"required\":[\"entered\",\"won\"],\"properties\":{\"entered\":{\"type\":\"integer\",\"format\":\"int32\"},\"won\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                    },
                    pub const json_schema = "{\"required\":[\"skill\",\"points\",\"races\"],\"properties\":{\"skill\":{\"type\":\"integer\",\"format\":\"int32\"},\"points\":{\"type\":\"integer\",\"format\":\"int32\"},\"races\":{\"required\":[\"entered\",\"won\"],\"properties\":{\"entered\":{\"type\":\"integer\",\"format\":\"int32\"},\"won\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}},\"type\":\"object\"}";
                },
                networth: struct {
                    total: i64,
                    pub const json_schema = "{\"required\":[\"total\"],\"properties\":{\"total\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}";
                },
                other: struct {
                    activity: struct {
                        time: i64,
                        streak: struct {
                            best: i64,
                            current: i64,
                            pub const json_schema = "{\"required\":[\"best\",\"current\"],\"properties\":{\"best\":{\"type\":\"integer\",\"format\":\"int32\"},\"current\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                        },
                        pub const json_schema = "{\"required\":[\"time\",\"streak\"],\"properties\":{\"time\":{\"description\":\"Time played in seconds\",\"type\":\"integer\",\"format\":\"int32\"},\"streak\":{\"required\":[\"best\",\"current\"],\"properties\":{\"best\":{\"type\":\"integer\",\"format\":\"int32\"},\"current\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}},\"type\":\"object\"}";
                    },
                    awards: i64,
                    merits_bought: i64,
                    refills: struct {
                        energy: i64,
                        nerve: i64,
                        token: i64,
                        pub const json_schema = "{\"required\":[\"energy\",\"nerve\",\"token\"],\"properties\":{\"energy\":{\"type\":\"integer\",\"format\":\"int32\"},\"nerve\":{\"type\":\"integer\",\"format\":\"int32\"},\"token\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                    },
                    donator_days: i64,
                    ranked_war_wins: i64,
                    pub const json_schema = "{\"required\":[\"activity\",\"awards\",\"merits_bought\",\"refills\",\"donator_days\",\"ranked_war_wins\"],\"properties\":{\"activity\":{\"required\":[\"time\",\"streak\"],\"properties\":{\"time\":{\"description\":\"Time played in seconds\",\"type\":\"integer\",\"format\":\"int32\"},\"streak\":{\"required\":[\"best\",\"current\"],\"properties\":{\"best\":{\"type\":\"integer\",\"format\":\"int32\"},\"current\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}},\"type\":\"object\"},\"awards\":{\"type\":\"integer\",\"format\":\"int32\"},\"merits_bought\":{\"type\":\"integer\",\"format\":\"int32\"},\"refills\":{\"required\":[\"energy\",\"nerve\",\"token\"],\"properties\":{\"energy\":{\"type\":\"integer\",\"format\":\"int32\"},\"nerve\":{\"type\":\"integer\",\"format\":\"int32\"},\"token\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"donator_days\":{\"type\":\"integer\",\"format\":\"int32\"},\"ranked_war_wins\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                },
                pub const json_schema = "{\"properties\":{\"attacking\":{\"required\":[\"attacks\",\"defends\",\"elo\",\"unarmored_wins\",\"highest_level_beaten\",\"escapes\",\"killstreak\",\"hits\",\"damage\",\"networth\",\"ammunition\",\"faction\"],\"properties\":{\"attacks\":{\"required\":[\"won\",\"lost\",\"stalemate\",\"assist\",\"stealth\"],\"properties\":{\"won\":{\"type\":\"integer\",\"format\":\"int32\"},\"lost\":{\"type\":\"integer\",\"format\":\"int32\"},\"stalemate\":{\"type\":\"integer\",\"format\":\"int32\"},\"assist\":{\"type\":\"integer\",\"format\":\"int32\"},\"stealth\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"defends\":{\"required\":[\"won\",\"lost\",\"stalemate\",\"total\"],\"properties\":{\"won\":{\"type\":\"integer\",\"format\":\"int32\"},\"lost\":{\"type\":\"integer\",\"format\":\"int32\"},\"stalemate\":{\"type\":\"integer\",\"format\":\"int32\"},\"total\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"elo\":{\"type\":\"integer\",\"format\":\"int32\"},\"unarmored_wins\":{\"type\":\"integer\",\"format\":\"int32\"},\"highest_level_beaten\":{\"type\":\"integer\",\"format\":\"int32\"},\"escapes\":{\"required\":[\"player\",\"foes\"],\"properties\":{\"player\":{\"type\":\"integer\",\"format\":\"int32\"},\"foes\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"killstreak\":{\"required\":[\"best\"],\"properties\":{\"best\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"hits\":{\"required\":[\"success\",\"miss\",\"critical\",\"one_hit_kills\"],\"properties\":{\"success\":{\"type\":\"integer\",\"format\":\"int32\"},\"miss\":{\"type\":\"integer\",\"format\":\"int32\"},\"critical\":{\"type\":\"integer\",\"format\":\"int32\"},\"one_hit_kills\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"damage\":{\"required\":[\"total\",\"best\"],\"properties\":{\"total\":{\"type\":\"integer\",\"format\":\"int64\"},\"best\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"networth\":{\"required\":[\"money_mugged\",\"largest_mug\",\"items_looted\"],\"properties\":{\"money_mugged\":{\"type\":\"integer\",\"format\":\"int64\"},\"largest_mug\":{\"type\":\"integer\",\"format\":\"int64\"},\"items_looted\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"ammunition\":{\"required\":[\"total\",\"special\",\"hollow_point\",\"tracer\",\"piercing\",\"incendiary\"],\"properties\":{\"total\":{\"type\":\"integer\",\"format\":\"int32\"},\"special\":{\"type\":\"integer\",\"format\":\"int32\"},\"hollow_point\":{\"type\":\"integer\",\"format\":\"int32\"},\"tracer\":{\"type\":\"integer\",\"format\":\"int32\"},\"piercing\":{\"type\":\"integer\",\"format\":\"int32\"},\"incendiary\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"faction\":{\"required\":[\"respect\",\"retaliations\",\"ranked_war_hits\",\"raid_hits\",\"territory\"],\"properties\":{\"respect\":{\"type\":\"integer\",\"format\":\"int32\"},\"retaliations\":{\"type\":\"integer\",\"format\":\"int32\"},\"ranked_war_hits\":{\"type\":\"integer\",\"format\":\"int32\"},\"raid_hits\":{\"type\":\"integer\",\"format\":\"int32\"},\"territory\":{\"required\":[\"wall_joins\",\"wall_clears\",\"wall_time\"],\"properties\":{\"wall_joins\":{\"type\":\"integer\",\"format\":\"int32\"},\"wall_clears\":{\"type\":\"integer\",\"format\":\"int32\"},\"wall_time\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}},\"type\":\"object\"}},\"type\":\"object\"},\"jobs\":{\"required\":[\"job_points_used\",\"trains_received\"],\"properties\":{\"job_points_used\":{\"type\":\"integer\",\"format\":\"int32\"},\"trains_received\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"trading\":{\"required\":[\"items\",\"trades\",\"points\",\"bazaar\"],\"properties\":{\"items\":{\"required\":[\"bought\",\"sent\",\"auctions\"],\"properties\":{\"bought\":{\"required\":[\"market\",\"shops\"],\"properties\":{\"market\":{\"type\":\"integer\",\"format\":\"int32\"},\"shops\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"auctions\":{\"required\":[\"won\",\"sold\"],\"properties\":{\"won\":{\"type\":\"integer\",\"format\":\"int32\"},\"sold\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"sent\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"trades\":{\"type\":\"integer\",\"format\":\"int32\"},\"points\":{\"required\":[\"bought\",\"sold\"],\"properties\":{\"bought\":{\"type\":\"integer\",\"format\":\"int32\"},\"sold\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"bazaar\":{\"required\":[\"customers\",\"sales\",\"profit\"],\"properties\":{\"customers\":{\"type\":\"integer\",\"format\":\"int32\"},\"sales\":{\"type\":\"integer\",\"format\":\"int32\"},\"profit\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"},\"item_market\":{\"required\":[\"customers\",\"sales\",\"revenue\",\"fees\"],\"properties\":{\"customers\":{\"type\":\"integer\",\"format\":\"int32\"},\"sales\":{\"type\":\"integer\",\"format\":\"int32\"},\"revenue\":{\"type\":\"integer\",\"format\":\"int64\"},\"fees\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}},\"type\":\"object\"},\"jail\":{\"required\":[\"times_jailed\",\"busts\",\"bails\"],\"properties\":{\"times_jailed\":{\"type\":\"integer\",\"format\":\"int32\"},\"busts\":{\"required\":[\"success\",\"fails\"],\"properties\":{\"success\":{\"type\":\"integer\",\"format\":\"int32\"},\"fails\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"bails\":{\"required\":[\"amount\",\"fees\"],\"properties\":{\"amount\":{\"type\":\"integer\",\"format\":\"int32\"},\"fees\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}},\"type\":\"object\"},\"hospital\":{\"required\":[\"times_hospitalized\",\"medical_items_used\",\"blood_withdrawn\",\"reviving\"],\"properties\":{\"times_hospitalized\":{\"type\":\"integer\",\"format\":\"int32\"},\"medical_items_used\":{\"type\":\"integer\",\"format\":\"int32\"},\"blood_withdrawn\":{\"type\":\"integer\",\"format\":\"int32\"},\"reviving\":{\"required\":[\"skill\",\"revives\",\"revives_received\"],\"properties\":{\"skill\":{\"type\":\"integer\",\"format\":\"int32\"},\"revives\":{\"type\":\"integer\",\"format\":\"int32\"},\"revives_received\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}},\"type\":\"object\"},\"finishing_hits\":{\"required\":[\"heavy_artillery\",\"machine_guns\",\"rifles\",\"sub_machine_guns\",\"shotguns\",\"pistols\",\"temporary\",\"piercing\",\"slashing\",\"clubbing\",\"mechanical\",\"hand_to_hand\"],\"properties\":{\"heavy_artillery\":{\"type\":\"integer\",\"format\":\"int32\"},\"machine_guns\":{\"type\":\"integer\",\"format\":\"int32\"},\"rifles\":{\"type\":\"integer\",\"format\":\"int32\"},\"sub_machine_guns\":{\"type\":\"integer\",\"format\":\"int32\"},\"shotguns\":{\"type\":\"integer\",\"format\":\"int32\"},\"pistols\":{\"type\":\"integer\",\"format\":\"int32\"},\"temporary\":{\"type\":\"integer\",\"format\":\"int32\"},\"piercing\":{\"type\":\"integer\",\"format\":\"int32\"},\"slashing\":{\"type\":\"integer\",\"format\":\"int32\"},\"clubbing\":{\"type\":\"integer\",\"format\":\"int32\"},\"mechanical\":{\"type\":\"integer\",\"format\":\"int32\"},\"hand_to_hand\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"communication\":{\"required\":[\"mails_sent\",\"classified_ads\",\"personals\"],\"properties\":{\"mails_sent\":{\"required\":[\"total\",\"friends\",\"faction\",\"colleagues\",\"spouse\"],\"properties\":{\"total\":{\"type\":\"integer\",\"format\":\"int32\"},\"friends\":{\"type\":\"integer\",\"format\":\"int32\"},\"faction\":{\"type\":\"integer\",\"format\":\"int32\"},\"colleagues\":{\"type\":\"integer\",\"format\":\"int32\"},\"spouse\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"classified_ads\":{\"type\":\"integer\",\"format\":\"int32\"},\"personals\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"crimes\":{\"oneOf\":[{\"$ref\":\"#/components/schemas/PersonalStatsCrimesV1\"},{\"$ref\":\"#/components/schemas/PersonalStatsCrimesV2\"}]},\"bounties\":{\"required\":[\"placed\",\"collected\",\"received\"],\"properties\":{\"placed\":{\"required\":[\"amount\",\"value\"],\"properties\":{\"amount\":{\"type\":\"integer\",\"format\":\"int32\"},\"value\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"},\"collected\":{\"required\":[\"amount\",\"value\"],\"properties\":{\"amount\":{\"type\":\"integer\",\"format\":\"int32\"},\"value\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"},\"received\":{\"required\":[\"amount\",\"value\"],\"properties\":{\"amount\":{\"type\":\"integer\",\"format\":\"int32\"},\"value\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}},\"type\":\"object\"},\"items\":{\"required\":[\"found\",\"trashed\",\"used\",\"viruses_coded\"],\"properties\":{\"found\":{\"required\":[\"city\",\"dump\",\"easter_eggs\"],\"properties\":{\"city\":{\"type\":\"integer\",\"format\":\"int32\"},\"dump\":{\"type\":\"integer\",\"format\":\"int32\"},\"easter_eggs\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"trashed\":{\"type\":\"integer\",\"format\":\"int32\"},\"used\":{\"required\":[\"books\",\"boosters\",\"consumables\",\"candy\",\"alcohol\",\"energy_drinks\",\"stat_enhancers\",\"easter_eggs\"],\"properties\":{\"books\":{\"type\":\"integer\",\"format\":\"int32\"},\"boosters\":{\"type\":\"integer\",\"format\":\"int32\"},\"consumables\":{\"type\":\"integer\",\"format\":\"int32\"},\"candy\":{\"type\":\"integer\",\"format\":\"int32\"},\"alcohol\":{\"type\":\"integer\",\"format\":\"int32\"},\"energy_drinks\":{\"type\":\"integer\",\"format\":\"int32\"},\"stat_enhancers\":{\"type\":\"integer\",\"format\":\"int32\"},\"easter_eggs\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"viruses_coded\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"travel\":{\"required\":[\"total\",\"time_spent\",\"items_bought\",\"hunting\",\"attacks_won\",\"defends_lost\",\"argentina\",\"canada\",\"cayman_islands\",\"china\",\"hawaii\",\"japan\",\"mexico\",\"united_arab_emirates\",\"united_kingdom\",\"south_africa\",\"switzerland\"],\"properties\":{\"total\":{\"type\":\"integer\",\"format\":\"int32\"},\"time_spent\":{\"type\":\"integer\",\"format\":\"int32\"},\"items_bought\":{\"type\":\"integer\",\"format\":\"int32\"},\"hunting\":{\"required\":[\"skill\"],\"properties\":{\"skill\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"attacks_won\":{\"type\":\"integer\",\"format\":\"int32\"},\"defends_lost\":{\"type\":\"integer\",\"format\":\"int32\"},\"argentina\":{\"type\":\"integer\",\"format\":\"int32\"},\"canada\":{\"type\":\"integer\",\"format\":\"int32\"},\"cayman_islands\":{\"type\":\"integer\",\"format\":\"int32\"},\"china\":{\"type\":\"integer\",\"format\":\"int32\"},\"hawaii\":{\"type\":\"integer\",\"format\":\"int32\"},\"japan\":{\"type\":\"integer\",\"format\":\"int32\"},\"mexico\":{\"type\":\"integer\",\"format\":\"int32\"},\"united_arab_emirates\":{\"type\":\"integer\",\"format\":\"int32\"},\"united_kingdom\":{\"type\":\"integer\",\"format\":\"int32\"},\"south_africa\":{\"type\":\"integer\",\"format\":\"int32\"},\"switzerland\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"drugs\":{\"required\":[\"cannabis\",\"ecstasy\",\"ketamine\",\"lsd\",\"opium\",\"pcp\",\"shrooms\",\"speed\",\"vicodin\",\"xanax\",\"total\",\"overdoses\",\"rehabilitations\"],\"properties\":{\"cannabis\":{\"type\":\"integer\",\"format\":\"int32\"},\"ecstasy\":{\"type\":\"integer\",\"format\":\"int32\"},\"ketamine\":{\"type\":\"integer\",\"format\":\"int32\"},\"lsd\":{\"type\":\"integer\",\"format\":\"int32\"},\"opium\":{\"type\":\"integer\",\"format\":\"int32\"},\"pcp\":{\"type\":\"integer\",\"format\":\"int32\"},\"shrooms\":{\"type\":\"integer\",\"format\":\"int32\"},\"speed\":{\"type\":\"integer\",\"format\":\"int32\"},\"vicodin\":{\"type\":\"integer\",\"format\":\"int32\"},\"xanax\":{\"type\":\"integer\",\"format\":\"int32\"},\"total\":{\"type\":\"integer\",\"format\":\"int32\"},\"overdoses\":{\"type\":\"integer\",\"format\":\"int32\"},\"rehabilitations\":{\"required\":[\"amount\",\"fees\"],\"properties\":{\"amount\":{\"type\":\"integer\",\"format\":\"int32\"},\"fees\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}},\"type\":\"object\"},\"missions\":{\"required\":[\"missions\",\"contracts\",\"credits\"],\"properties\":{\"missions\":{\"type\":\"integer\",\"format\":\"int32\"},\"contracts\":{\"required\":[\"total\",\"duke\"],\"properties\":{\"total\":{\"type\":\"integer\",\"format\":\"int32\"},\"duke\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"credits\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"racing\":{\"required\":[\"skill\",\"points\",\"races\"],\"properties\":{\"skill\":{\"type\":\"integer\",\"format\":\"int32\"},\"points\":{\"type\":\"integer\",\"format\":\"int32\"},\"races\":{\"required\":[\"entered\",\"won\"],\"properties\":{\"entered\":{\"type\":\"integer\",\"format\":\"int32\"},\"won\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}},\"type\":\"object\"},\"networth\":{\"required\":[\"total\"],\"properties\":{\"total\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"},\"other\":{\"required\":[\"activity\",\"awards\",\"merits_bought\",\"refills\",\"donator_days\",\"ranked_war_wins\"],\"properties\":{\"activity\":{\"required\":[\"time\",\"streak\"],\"properties\":{\"time\":{\"description\":\"Time played in seconds\",\"type\":\"integer\",\"format\":\"int32\"},\"streak\":{\"required\":[\"best\",\"current\"],\"properties\":{\"best\":{\"type\":\"integer\",\"format\":\"int32\"},\"current\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}},\"type\":\"object\"},\"awards\":{\"type\":\"integer\",\"format\":\"int32\"},\"merits_bought\":{\"type\":\"integer\",\"format\":\"int32\"},\"refills\":{\"required\":[\"energy\",\"nerve\",\"token\"],\"properties\":{\"energy\":{\"type\":\"integer\",\"format\":\"int32\"},\"nerve\":{\"type\":\"integer\",\"format\":\"int32\"},\"token\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"donator_days\":{\"type\":\"integer\",\"format\":\"int32\"},\"ranked_war_wins\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}},\"required\":[\"attacking\",\"jobs\",\"trading\",\"jail\",\"hospital\",\"finishing_hits\",\"communication\",\"crimes\",\"bounties\",\"items\",\"travel\",\"drugs\",\"missions\",\"racing\",\"networth\",\"other\"]}";
            },
            v2: struct {
                attacking: struct {
                    attacks: struct {
                        won: i64,
                        lost: i64,
                        stalemate: i64,
                        assist: i64,
                        pub const json_schema = "{\"required\":[\"won\",\"lost\",\"stalemate\",\"assist\"],\"properties\":{\"won\":{\"type\":\"integer\",\"format\":\"int32\"},\"lost\":{\"type\":\"integer\",\"format\":\"int32\"},\"stalemate\":{\"type\":\"integer\",\"format\":\"int32\"},\"assist\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                    },
                    defends: struct {
                        won: i64,
                        lost: i64,
                        stalemate: i64,
                        pub const json_schema = "{\"required\":[\"won\",\"lost\",\"stalemate\"],\"properties\":{\"won\":{\"type\":\"integer\",\"format\":\"int32\"},\"lost\":{\"type\":\"integer\",\"format\":\"int32\"},\"stalemate\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                    },
                    elo: i64,
                    escapes: struct {
                        player: i64,
                        foes: i64,
                        pub const json_schema = "{\"required\":[\"player\",\"foes\"],\"properties\":{\"player\":{\"type\":\"integer\",\"format\":\"int32\"},\"foes\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                    },
                    killstreak: struct {
                        best: i64,
                        pub const json_schema = "{\"required\":[\"best\"],\"properties\":{\"best\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                    },
                    hits: struct {
                        success: i64,
                        miss: i64,
                        critical: i64,
                        one_hit_kills: i64,
                        pub const json_schema = "{\"required\":[\"success\",\"miss\",\"critical\",\"one_hit_kills\"],\"properties\":{\"success\":{\"type\":\"integer\",\"format\":\"int32\"},\"miss\":{\"type\":\"integer\",\"format\":\"int32\"},\"critical\":{\"type\":\"integer\",\"format\":\"int32\"},\"one_hit_kills\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                    },
                    damage: struct {
                        total: i64,
                        best: i64,
                        pub const json_schema = "{\"required\":[\"best\",\"total\"],\"properties\":{\"total\":{\"type\":\"integer\",\"format\":\"int64\"},\"best\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                    },
                    networth: struct {
                        money_mugged: i64,
                        largest_mug: i64,
                        items_looted: i64,
                        pub const json_schema = "{\"required\":[\"money_mugged\",\"largest_mug\",\"items_looted\"],\"properties\":{\"money_mugged\":{\"type\":\"integer\",\"format\":\"int64\"},\"largest_mug\":{\"type\":\"integer\",\"format\":\"int64\"},\"items_looted\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                    },
                    ammunition: struct {
                        total: i64,
                        special: i64,
                        hollow_point: i64,
                        tracer: i64,
                        piercing: i64,
                        incendiary: i64,
                        pub const json_schema = "{\"required\":[\"total\",\"special\",\"hollow_point\",\"tracer\",\"piercing\",\"incendiary\"],\"properties\":{\"total\":{\"type\":\"integer\",\"format\":\"int32\"},\"special\":{\"type\":\"integer\",\"format\":\"int32\"},\"hollow_point\":{\"type\":\"integer\",\"format\":\"int32\"},\"tracer\":{\"type\":\"integer\",\"format\":\"int32\"},\"piercing\":{\"type\":\"integer\",\"format\":\"int32\"},\"incendiary\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                    },
                    faction: struct {
                        respect: i64,
                        ranked_war_hits: i64,
                        pub const json_schema = "{\"required\":[\"respect\",\"ranked_war_hits\"],\"properties\":{\"respect\":{\"type\":\"integer\",\"format\":\"int32\"},\"ranked_war_hits\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                    },
                    pub const json_schema = "{\"required\":[\"attacks\",\"defends\",\"elo\",\"escapes\",\"killstreak\",\"hits\",\"damage\",\"networth\",\"ammunition\",\"faction\"],\"properties\":{\"attacks\":{\"required\":[\"won\",\"lost\",\"stalemate\",\"assist\"],\"properties\":{\"won\":{\"type\":\"integer\",\"format\":\"int32\"},\"lost\":{\"type\":\"integer\",\"format\":\"int32\"},\"stalemate\":{\"type\":\"integer\",\"format\":\"int32\"},\"assist\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"defends\":{\"required\":[\"won\",\"lost\",\"stalemate\"],\"properties\":{\"won\":{\"type\":\"integer\",\"format\":\"int32\"},\"lost\":{\"type\":\"integer\",\"format\":\"int32\"},\"stalemate\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"elo\":{\"type\":\"integer\",\"format\":\"int32\"},\"escapes\":{\"required\":[\"player\",\"foes\"],\"properties\":{\"player\":{\"type\":\"integer\",\"format\":\"int32\"},\"foes\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"killstreak\":{\"required\":[\"best\"],\"properties\":{\"best\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"hits\":{\"required\":[\"success\",\"miss\",\"critical\",\"one_hit_kills\"],\"properties\":{\"success\":{\"type\":\"integer\",\"format\":\"int32\"},\"miss\":{\"type\":\"integer\",\"format\":\"int32\"},\"critical\":{\"type\":\"integer\",\"format\":\"int32\"},\"one_hit_kills\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"damage\":{\"required\":[\"best\",\"total\"],\"properties\":{\"total\":{\"type\":\"integer\",\"format\":\"int64\"},\"best\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"networth\":{\"required\":[\"money_mugged\",\"largest_mug\",\"items_looted\"],\"properties\":{\"money_mugged\":{\"type\":\"integer\",\"format\":\"int64\"},\"largest_mug\":{\"type\":\"integer\",\"format\":\"int64\"},\"items_looted\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"ammunition\":{\"required\":[\"total\",\"special\",\"hollow_point\",\"tracer\",\"piercing\",\"incendiary\"],\"properties\":{\"total\":{\"type\":\"integer\",\"format\":\"int32\"},\"special\":{\"type\":\"integer\",\"format\":\"int32\"},\"hollow_point\":{\"type\":\"integer\",\"format\":\"int32\"},\"tracer\":{\"type\":\"integer\",\"format\":\"int32\"},\"piercing\":{\"type\":\"integer\",\"format\":\"int32\"},\"incendiary\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"faction\":{\"required\":[\"respect\",\"ranked_war_hits\"],\"properties\":{\"respect\":{\"type\":\"integer\",\"format\":\"int32\"},\"ranked_war_hits\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}},\"type\":\"object\"}";
                },
                jobs: struct {
                    job_points_used: i64,
                    trains_received: i64,
                    pub const json_schema = "{\"required\":[\"job_points_used\",\"trains_received\"],\"properties\":{\"job_points_used\":{\"type\":\"integer\",\"format\":\"int32\"},\"trains_received\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                },
                hospital: struct {
                    medical_items_used: i64,
                    reviving: struct {
                        skill: i64,
                        revives: i64,
                        pub const json_schema = "{\"required\":[\"skill\",\"revives\"],\"properties\":{\"skill\":{\"type\":\"integer\",\"format\":\"int32\"},\"revives\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                    },
                    pub const json_schema = "{\"required\":[\"medical_items_used\",\"reviving\"],\"properties\":{\"medical_items_used\":{\"type\":\"integer\",\"format\":\"int32\"},\"reviving\":{\"required\":[\"skill\",\"revives\"],\"properties\":{\"skill\":{\"type\":\"integer\",\"format\":\"int32\"},\"revives\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}},\"type\":\"object\"}";
                },
                crimes: struct {
                    total: i64,
                    version: []const u8,
                    pub const json_schema = "{\"required\":[\"total\",\"version\"],\"properties\":{\"total\":{\"type\":\"integer\",\"format\":\"int32\"},\"version\":{\"type\":\"string\"}},\"type\":\"object\"}";
                },
                items: struct {
                    found: struct {
                        dump: i64,
                        pub const json_schema = "{\"required\":[\"dump\"],\"properties\":{\"dump\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                    },
                    used: struct {
                        books: i64,
                        boosters: i64,
                        consumables: i64,
                        candy: i64,
                        alcohol: i64,
                        energy_drinks: i64,
                        stat_enhancers: i64,
                        easter_eggs: i64,
                        pub const json_schema = "{\"required\":[\"books\",\"boosters\",\"consumables\",\"candy\",\"alcohol\",\"energy_drinks\",\"stat_enhancers\",\"easter_eggs\"],\"properties\":{\"books\":{\"type\":\"integer\",\"format\":\"int32\"},\"boosters\":{\"type\":\"integer\",\"format\":\"int32\"},\"consumables\":{\"type\":\"integer\",\"format\":\"int32\"},\"candy\":{\"type\":\"integer\",\"format\":\"int32\"},\"alcohol\":{\"type\":\"integer\",\"format\":\"int32\"},\"energy_drinks\":{\"type\":\"integer\",\"format\":\"int32\"},\"stat_enhancers\":{\"type\":\"integer\",\"format\":\"int32\"},\"easter_eggs\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                    },
                    pub const json_schema = "{\"required\":[\"found\",\"used\"],\"properties\":{\"found\":{\"required\":[\"dump\"],\"properties\":{\"dump\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"used\":{\"required\":[\"books\",\"boosters\",\"consumables\",\"candy\",\"alcohol\",\"energy_drinks\",\"stat_enhancers\",\"easter_eggs\"],\"properties\":{\"books\":{\"type\":\"integer\",\"format\":\"int32\"},\"boosters\":{\"type\":\"integer\",\"format\":\"int32\"},\"consumables\":{\"type\":\"integer\",\"format\":\"int32\"},\"candy\":{\"type\":\"integer\",\"format\":\"int32\"},\"alcohol\":{\"type\":\"integer\",\"format\":\"int32\"},\"energy_drinks\":{\"type\":\"integer\",\"format\":\"int32\"},\"stat_enhancers\":{\"type\":\"integer\",\"format\":\"int32\"},\"easter_eggs\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}},\"type\":\"object\"}";
                },
                travel: struct {
                    total: i64,
                    time_spent: i64,
                    pub const json_schema = "{\"required\":[\"total\",\"time_spent\"],\"properties\":{\"total\":{\"type\":\"integer\",\"format\":\"int32\"},\"time_spent\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                },
                drugs: struct {
                    cannabis: i64,
                    ecstasy: i64,
                    ketamine: i64,
                    lsd: i64,
                    opium: i64,
                    pcp: i64,
                    shrooms: i64,
                    speed: i64,
                    vicodin: i64,
                    xanax: i64,
                    total: i64,
                    overdoses: i64,
                    rehabilitations: struct {
                        amount: i64,
                        fees: i64,
                        pub const json_schema = "{\"required\":[\"amount\",\"fees\"],\"properties\":{\"amount\":{\"type\":\"integer\",\"format\":\"int32\"},\"fees\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}";
                    },
                    pub const json_schema = "{\"required\":[\"cannabis\",\"ecstasy\",\"ketamine\",\"lsd\",\"opium\",\"pcp\",\"shrooms\",\"speed\",\"vicodin\",\"xanax\",\"total\",\"overdoses\",\"rehabilitations\"],\"properties\":{\"cannabis\":{\"type\":\"integer\",\"format\":\"int32\"},\"ecstasy\":{\"type\":\"integer\",\"format\":\"int32\"},\"ketamine\":{\"type\":\"integer\",\"format\":\"int32\"},\"lsd\":{\"type\":\"integer\",\"format\":\"int32\"},\"opium\":{\"type\":\"integer\",\"format\":\"int32\"},\"pcp\":{\"type\":\"integer\",\"format\":\"int32\"},\"shrooms\":{\"type\":\"integer\",\"format\":\"int32\"},\"speed\":{\"type\":\"integer\",\"format\":\"int32\"},\"vicodin\":{\"type\":\"integer\",\"format\":\"int32\"},\"xanax\":{\"type\":\"integer\",\"format\":\"int32\"},\"total\":{\"type\":\"integer\",\"format\":\"int32\"},\"overdoses\":{\"type\":\"integer\",\"format\":\"int32\"},\"rehabilitations\":{\"required\":[\"amount\",\"fees\"],\"properties\":{\"amount\":{\"type\":\"integer\",\"format\":\"int32\"},\"fees\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}},\"type\":\"object\"}";
                },
                networth: struct {
                    total: i64,
                    pub const json_schema = "{\"required\":[\"total\"],\"properties\":{\"total\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}";
                },
                other: struct {
                    activity: struct {
                        time: i64,
                        streak: struct {
                            best: i64,
                            current: i64,
                            pub const json_schema = "{\"required\":[\"best\",\"current\"],\"properties\":{\"best\":{\"type\":\"integer\",\"format\":\"int32\"},\"current\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                        },
                        pub const json_schema = "{\"required\":[\"time\",\"streak\"],\"properties\":{\"time\":{\"description\":\"Time played in seconds\",\"type\":\"integer\",\"format\":\"int32\"},\"streak\":{\"required\":[\"best\",\"current\"],\"properties\":{\"best\":{\"type\":\"integer\",\"format\":\"int32\"},\"current\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}},\"type\":\"object\"}";
                    },
                    awards: i64,
                    merits_bought: i64,
                    refills: struct {
                        energy: i64,
                        nerve: i64,
                        pub const json_schema = "{\"required\":[\"energy\",\"nerve\"],\"properties\":{\"energy\":{\"type\":\"integer\",\"format\":\"int32\"},\"nerve\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                    },
                    donator_days: i64,
                    ranked_war_wins: i64,
                    pub const json_schema = "{\"required\":[\"activity\",\"awards\",\"merits_bought\",\"refills\",\"donator_days\",\"ranked_war_wins\"],\"properties\":{\"activity\":{\"required\":[\"time\",\"streak\"],\"properties\":{\"time\":{\"description\":\"Time played in seconds\",\"type\":\"integer\",\"format\":\"int32\"},\"streak\":{\"required\":[\"best\",\"current\"],\"properties\":{\"best\":{\"type\":\"integer\",\"format\":\"int32\"},\"current\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}},\"type\":\"object\"},\"awards\":{\"type\":\"integer\",\"format\":\"int32\"},\"merits_bought\":{\"type\":\"integer\",\"format\":\"int32\"},\"refills\":{\"required\":[\"energy\",\"nerve\"],\"properties\":{\"energy\":{\"type\":\"integer\",\"format\":\"int32\"},\"nerve\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"donator_days\":{\"type\":\"integer\",\"format\":\"int32\"},\"ranked_war_wins\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                },
                pub const json_schema = "{\"properties\":{\"attacking\":{\"required\":[\"attacks\",\"defends\",\"elo\",\"escapes\",\"killstreak\",\"hits\",\"damage\",\"networth\",\"ammunition\",\"faction\"],\"properties\":{\"attacks\":{\"required\":[\"won\",\"lost\",\"stalemate\",\"assist\"],\"properties\":{\"won\":{\"type\":\"integer\",\"format\":\"int32\"},\"lost\":{\"type\":\"integer\",\"format\":\"int32\"},\"stalemate\":{\"type\":\"integer\",\"format\":\"int32\"},\"assist\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"defends\":{\"required\":[\"won\",\"lost\",\"stalemate\"],\"properties\":{\"won\":{\"type\":\"integer\",\"format\":\"int32\"},\"lost\":{\"type\":\"integer\",\"format\":\"int32\"},\"stalemate\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"elo\":{\"type\":\"integer\",\"format\":\"int32\"},\"escapes\":{\"required\":[\"player\",\"foes\"],\"properties\":{\"player\":{\"type\":\"integer\",\"format\":\"int32\"},\"foes\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"killstreak\":{\"required\":[\"best\"],\"properties\":{\"best\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"hits\":{\"required\":[\"success\",\"miss\",\"critical\",\"one_hit_kills\"],\"properties\":{\"success\":{\"type\":\"integer\",\"format\":\"int32\"},\"miss\":{\"type\":\"integer\",\"format\":\"int32\"},\"critical\":{\"type\":\"integer\",\"format\":\"int32\"},\"one_hit_kills\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"damage\":{\"required\":[\"best\",\"total\"],\"properties\":{\"total\":{\"type\":\"integer\",\"format\":\"int64\"},\"best\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"networth\":{\"required\":[\"money_mugged\",\"largest_mug\",\"items_looted\"],\"properties\":{\"money_mugged\":{\"type\":\"integer\",\"format\":\"int64\"},\"largest_mug\":{\"type\":\"integer\",\"format\":\"int64\"},\"items_looted\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"ammunition\":{\"required\":[\"total\",\"special\",\"hollow_point\",\"tracer\",\"piercing\",\"incendiary\"],\"properties\":{\"total\":{\"type\":\"integer\",\"format\":\"int32\"},\"special\":{\"type\":\"integer\",\"format\":\"int32\"},\"hollow_point\":{\"type\":\"integer\",\"format\":\"int32\"},\"tracer\":{\"type\":\"integer\",\"format\":\"int32\"},\"piercing\":{\"type\":\"integer\",\"format\":\"int32\"},\"incendiary\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"faction\":{\"required\":[\"respect\",\"ranked_war_hits\"],\"properties\":{\"respect\":{\"type\":\"integer\",\"format\":\"int32\"},\"ranked_war_hits\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}},\"type\":\"object\"},\"jobs\":{\"required\":[\"job_points_used\",\"trains_received\"],\"properties\":{\"job_points_used\":{\"type\":\"integer\",\"format\":\"int32\"},\"trains_received\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"hospital\":{\"required\":[\"medical_items_used\",\"reviving\"],\"properties\":{\"medical_items_used\":{\"type\":\"integer\",\"format\":\"int32\"},\"reviving\":{\"required\":[\"skill\",\"revives\"],\"properties\":{\"skill\":{\"type\":\"integer\",\"format\":\"int32\"},\"revives\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}},\"type\":\"object\"},\"crimes\":{\"required\":[\"total\",\"version\"],\"properties\":{\"total\":{\"type\":\"integer\",\"format\":\"int32\"},\"version\":{\"type\":\"string\"}},\"type\":\"object\"},\"items\":{\"required\":[\"found\",\"used\"],\"properties\":{\"found\":{\"required\":[\"dump\"],\"properties\":{\"dump\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"used\":{\"required\":[\"books\",\"boosters\",\"consumables\",\"candy\",\"alcohol\",\"energy_drinks\",\"stat_enhancers\",\"easter_eggs\"],\"properties\":{\"books\":{\"type\":\"integer\",\"format\":\"int32\"},\"boosters\":{\"type\":\"integer\",\"format\":\"int32\"},\"consumables\":{\"type\":\"integer\",\"format\":\"int32\"},\"candy\":{\"type\":\"integer\",\"format\":\"int32\"},\"alcohol\":{\"type\":\"integer\",\"format\":\"int32\"},\"energy_drinks\":{\"type\":\"integer\",\"format\":\"int32\"},\"stat_enhancers\":{\"type\":\"integer\",\"format\":\"int32\"},\"easter_eggs\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}},\"type\":\"object\"},\"travel\":{\"required\":[\"total\",\"time_spent\"],\"properties\":{\"total\":{\"type\":\"integer\",\"format\":\"int32\"},\"time_spent\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"drugs\":{\"required\":[\"cannabis\",\"ecstasy\",\"ketamine\",\"lsd\",\"opium\",\"pcp\",\"shrooms\",\"speed\",\"vicodin\",\"xanax\",\"total\",\"overdoses\",\"rehabilitations\"],\"properties\":{\"cannabis\":{\"type\":\"integer\",\"format\":\"int32\"},\"ecstasy\":{\"type\":\"integer\",\"format\":\"int32\"},\"ketamine\":{\"type\":\"integer\",\"format\":\"int32\"},\"lsd\":{\"type\":\"integer\",\"format\":\"int32\"},\"opium\":{\"type\":\"integer\",\"format\":\"int32\"},\"pcp\":{\"type\":\"integer\",\"format\":\"int32\"},\"shrooms\":{\"type\":\"integer\",\"format\":\"int32\"},\"speed\":{\"type\":\"integer\",\"format\":\"int32\"},\"vicodin\":{\"type\":\"integer\",\"format\":\"int32\"},\"xanax\":{\"type\":\"integer\",\"format\":\"int32\"},\"total\":{\"type\":\"integer\",\"format\":\"int32\"},\"overdoses\":{\"type\":\"integer\",\"format\":\"int32\"},\"rehabilitations\":{\"required\":[\"amount\",\"fees\"],\"properties\":{\"amount\":{\"type\":\"integer\",\"format\":\"int32\"},\"fees\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}},\"type\":\"object\"},\"networth\":{\"required\":[\"total\"],\"properties\":{\"total\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"},\"other\":{\"required\":[\"activity\",\"awards\",\"merits_bought\",\"refills\",\"donator_days\",\"ranked_war_wins\"],\"properties\":{\"activity\":{\"required\":[\"time\",\"streak\"],\"properties\":{\"time\":{\"description\":\"Time played in seconds\",\"type\":\"integer\",\"format\":\"int32\"},\"streak\":{\"required\":[\"best\",\"current\"],\"properties\":{\"best\":{\"type\":\"integer\",\"format\":\"int32\"},\"current\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}},\"type\":\"object\"},\"awards\":{\"type\":\"integer\",\"format\":\"int32\"},\"merits_bought\":{\"type\":\"integer\",\"format\":\"int32\"},\"refills\":{\"required\":[\"energy\",\"nerve\"],\"properties\":{\"energy\":{\"type\":\"integer\",\"format\":\"int32\"},\"nerve\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"donator_days\":{\"type\":\"integer\",\"format\":\"int32\"},\"ranked_war_wins\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}},\"required\":[\"attacking\",\"jobs\",\"hospital\",\"crimes\",\"items\",\"travel\",\"drugs\",\"networth\",\"other\"]}";
            },
            v3: union(enum) {
                v0: PersonalStatsAttackingPublic,
                v1: PersonalStatsJobsPublic,
                v2: PersonalStatsTrading,
                v3: PersonalStatsJail,
                v4: PersonalStatsHospital,
                v5: PersonalStatsFinishingHits,
                v6: PersonalStatsCommunication,
                v7: PersonalStatsCrimes,
                v8: PersonalStatsBounties,
                v9: PersonalStatsItems,
                v10: PersonalStatsTravel,
                v11: PersonalStatsDrugs,
                v12: PersonalStatsMissions,
                v13: PersonalStatsRacing,
                v14: PersonalStatsNetworthPublic,
                v15: PersonalStatsOther,
            },
            v4: []const PersonalStatsHistoricStat,
        }) = .absent,
        organizedCrime: model.Presence(union(enum) {
            v0: FactionCrime,
            v1: UserOrganizedCrimeError,
            v2: void,
        }) = .absent,
        itemmods: model.Presence([]const UserItemMod) = .absent,
        attacks: model.Presence(union(enum) {
            v0: []const Attack,
            v1: []const AttackSimplified,
        }) = .absent,
        bars: model.Presence(UserBars) = .absent,
        cooldowns: model.Presence(struct {
            drug: i64,
            medical: i64,
            booster: i64,
            pub const json_schema = "{\"required\":[\"drug\",\"medical\",\"booster\"],\"properties\":{\"drug\":{\"type\":\"integer\",\"format\":\"int32\"},\"medical\":{\"type\":\"integer\",\"format\":\"int32\"},\"booster\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
        }) = .absent,
        notifications: model.Presence(struct {
            messages: i64,
            events: i64,
            awards: i64,
            competition: i64,
            pub const json_schema = "{\"required\":[\"messages\",\"events\",\"awards\",\"competition\"],\"properties\":{\"messages\":{\"type\":\"integer\",\"format\":\"int32\"},\"events\":{\"type\":\"integer\",\"format\":\"int32\"},\"awards\":{\"type\":\"integer\",\"format\":\"int32\"},\"competition\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
        }) = .absent,
        perks: model.Presence(struct {
            faction: []const []const u8,
            job: []const []const u8,
            property: []const []const u8,
            education: []const []const u8,
            enhancer: []const []const u8,
            book: []const []const u8,
            stock: []const []const u8,
            merit: []const []const u8,
            pub const json_schema = "{\"required\":[\"faction\",\"job\",\"property\",\"education\",\"enhancer\",\"book\",\"stock\",\"merit\"],\"properties\":{\"faction\":{\"type\":\"array\",\"items\":{\"type\":\"string\"}},\"job\":{\"type\":\"array\",\"items\":{\"type\":\"string\"}},\"property\":{\"type\":\"array\",\"items\":{\"type\":\"string\"}},\"education\":{\"type\":\"array\",\"items\":{\"type\":\"string\"}},\"enhancer\":{\"type\":\"array\",\"items\":{\"type\":\"string\"}},\"book\":{\"type\":\"array\",\"items\":{\"type\":\"string\"}},\"stock\":{\"type\":\"array\",\"items\":{\"type\":\"string\"}},\"merit\":{\"type\":\"array\",\"items\":{\"type\":\"string\"}}},\"type\":\"object\"}";
        }) = .absent,
        refills: model.Presence(struct {
            energy: bool,
            nerve: bool,
            token: bool,
            special_count: i64,
            pub const json_schema = "{\"required\":[\"energy\",\"nerve\",\"token\",\"special_count\"],\"properties\":{\"energy\":{\"type\":\"boolean\"},\"nerve\":{\"type\":\"boolean\"},\"token\":{\"type\":\"boolean\"},\"special_count\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
        }) = .absent,
        travel: model.Presence(struct {
            destination: CountryEnum,
            method: ?UserFlyMethodEnum,
            departed_at: ?i64,
            arrival_at: ?i64,
            time_left: i64,
            pub const json_schema = "{\"required\":[\"destination\",\"method\",\"departed_at\",\"arrival_at\",\"time_left\"],\"properties\":{\"destination\":{\"$ref\":\"#/components/schemas/CountryEnum\"},\"method\":{\"description\":\"Null if the player has never flown before.\",\"oneOf\":[{\"$ref\":\"#/components/schemas/UserFlyMethodEnum\"},{\"type\":\"null\"}]},\"departed_at\":{\"description\":\"Null if the player has never flown before.\",\"oneOf\":[{\"type\":\"integer\",\"format\":\"int32\"},{\"type\":\"null\"}]},\"arrival_at\":{\"description\":\"Null if the player has never flown before.\",\"oneOf\":[{\"type\":\"integer\",\"format\":\"int32\"},{\"type\":\"null\"}]},\"time_left\":{\"description\":\"Time left in seconds.\",\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
        }) = .absent,
        virus: model.Presence(?UserVirus) = .absent,
        casino: model.Presence(struct {
            tokens: i64,
            streak: i64,
            pub const json_schema = "{\"required\":[\"tokens\",\"streak\"],\"properties\":{\"tokens\":{\"type\":\"integer\",\"format\":\"int32\"},\"streak\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}";
        }) = .absent,
        halloween: model.Presence(UserHalloween) = .absent,
        networth: model.Presence(struct {
            money: struct {
                pending: i64,
                wallet: i64,
                vault: i64,
                bookie: i64,
                city_bank: i64,
                cayman_bank: i64,
                piggy_bank: i64,
                loans: i64,
                unpaid_fees: i64,
                pub const json_schema = "{\"required\":[\"pending\",\"wallet\",\"vault\",\"bookie\",\"city_bank\",\"cayman_bank\",\"piggy_bank\",\"loans\",\"unpaid_fees\"],\"properties\":{\"pending\":{\"type\":\"integer\",\"format\":\"int64\"},\"wallet\":{\"type\":\"integer\",\"format\":\"int64\"},\"vault\":{\"type\":\"integer\",\"format\":\"int64\"},\"bookie\":{\"type\":\"integer\",\"format\":\"int64\"},\"city_bank\":{\"type\":\"integer\",\"format\":\"int64\"},\"cayman_bank\":{\"type\":\"integer\",\"format\":\"int64\"},\"piggy_bank\":{\"type\":\"integer\",\"format\":\"int64\"},\"loans\":{\"type\":\"integer\",\"format\":\"int64\"},\"unpaid_fees\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}";
            },
            items: struct {
                inventory: i64,
                display_case: i64,
                bazaar: i64,
                trades: i64,
                item_market: i64,
                auction_house: i64,
                enlisted_cars: i64,
                pub const json_schema = "{\"required\":[\"inventory\",\"display_case\",\"bazaar\",\"trades\",\"item_market\",\"auction_house\",\"enlisted_cars\"],\"properties\":{\"inventory\":{\"type\":\"integer\",\"format\":\"int64\"},\"display_case\":{\"type\":\"integer\",\"format\":\"int64\"},\"bazaar\":{\"type\":\"integer\",\"format\":\"int64\"},\"trades\":{\"type\":\"integer\",\"format\":\"int64\"},\"item_market\":{\"type\":\"integer\",\"format\":\"int64\"},\"auction_house\":{\"type\":\"integer\",\"format\":\"int64\"},\"enlisted_cars\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}";
            },
            assets: struct {
                property: i64,
                stock_market: i64,
                company: i64,
                pub const json_schema = "{\"required\":[\"property\",\"stock_market\",\"company\"],\"properties\":{\"property\":{\"type\":\"integer\",\"format\":\"int64\"},\"stock_market\":{\"type\":\"integer\",\"format\":\"int64\"},\"company\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}";
            },
            points: i64,
            total: i64,
            timestamp: i64,
            pub const json_schema = "{\"required\":[\"money\",\"items\",\"assets\",\"points\",\"total\",\"timestamp\"],\"properties\":{\"money\":{\"required\":[\"pending\",\"wallet\",\"vault\",\"bookie\",\"city_bank\",\"cayman_bank\",\"piggy_bank\",\"loans\",\"unpaid_fees\"],\"properties\":{\"pending\":{\"type\":\"integer\",\"format\":\"int64\"},\"wallet\":{\"type\":\"integer\",\"format\":\"int64\"},\"vault\":{\"type\":\"integer\",\"format\":\"int64\"},\"bookie\":{\"type\":\"integer\",\"format\":\"int64\"},\"city_bank\":{\"type\":\"integer\",\"format\":\"int64\"},\"cayman_bank\":{\"type\":\"integer\",\"format\":\"int64\"},\"piggy_bank\":{\"type\":\"integer\",\"format\":\"int64\"},\"loans\":{\"type\":\"integer\",\"format\":\"int64\"},\"unpaid_fees\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"},\"items\":{\"required\":[\"inventory\",\"display_case\",\"bazaar\",\"trades\",\"item_market\",\"auction_house\",\"enlisted_cars\"],\"properties\":{\"inventory\":{\"type\":\"integer\",\"format\":\"int64\"},\"display_case\":{\"type\":\"integer\",\"format\":\"int64\"},\"bazaar\":{\"type\":\"integer\",\"format\":\"int64\"},\"trades\":{\"type\":\"integer\",\"format\":\"int64\"},\"item_market\":{\"type\":\"integer\",\"format\":\"int64\"},\"auction_house\":{\"type\":\"integer\",\"format\":\"int64\"},\"enlisted_cars\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"},\"assets\":{\"required\":[\"property\",\"stock_market\",\"company\"],\"properties\":{\"property\":{\"type\":\"integer\",\"format\":\"int64\"},\"stock_market\":{\"type\":\"integer\",\"format\":\"int64\"},\"company\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"},\"points\":{\"type\":\"integer\",\"format\":\"int64\"},\"total\":{\"type\":\"integer\",\"format\":\"int64\"},\"timestamp\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
        }) = .absent,
        money: model.Presence(struct {
            points: i64,
            wallet: i64,
            company: i64,
            vault: i64,
            cayman_bank: i64,
            city_bank: ?struct {
                amount: i64,
                profit: i64,
                duration: i64,
                interest_rate: f64,
                until: i64,
                invested_at: i64,
                pub const json_schema = "{\"required\":[\"amount\",\"profit\",\"duration\",\"interest_rate\",\"until\",\"invested_at\"],\"properties\":{\"amount\":{\"type\":\"integer\",\"format\":\"int64\"},\"profit\":{\"type\":\"integer\",\"format\":\"int64\"},\"duration\":{\"description\":\"Initial duration in days.\",\"type\":\"integer\",\"format\":\"int32\"},\"interest_rate\":{\"type\":\"number\",\"format\":\"float\"},\"until\":{\"type\":\"integer\",\"format\":\"int64\"},\"invested_at\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
            },
            faction: ?struct {
                money: i64,
                points: i64,
                pub const json_schema = "{\"required\":[\"money\",\"points\"],\"properties\":{\"money\":{\"type\":\"integer\",\"format\":\"int64\"},\"points\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}";
            },
            daily_networth: i64,
            pub const json_schema = "{\"required\":[\"points\",\"wallet\",\"company\",\"vault\",\"cayman_bank\",\"city_bank\",\"faction\",\"daily_networth\"],\"properties\":{\"points\":{\"type\":\"integer\",\"format\":\"int64\"},\"wallet\":{\"type\":\"integer\",\"format\":\"int64\"},\"company\":{\"type\":\"integer\",\"format\":\"int64\"},\"vault\":{\"type\":\"integer\",\"format\":\"int64\"},\"cayman_bank\":{\"type\":\"integer\",\"format\":\"int64\"},\"city_bank\":{\"oneOf\":[{\"required\":[\"amount\",\"profit\",\"duration\",\"interest_rate\",\"until\",\"invested_at\"],\"properties\":{\"amount\":{\"type\":\"integer\",\"format\":\"int64\"},\"profit\":{\"type\":\"integer\",\"format\":\"int64\"},\"duration\":{\"description\":\"Initial duration in days.\",\"type\":\"integer\",\"format\":\"int32\"},\"interest_rate\":{\"type\":\"number\",\"format\":\"float\"},\"until\":{\"type\":\"integer\",\"format\":\"int64\"},\"invested_at\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},{\"type\":\"null\"}]},\"faction\":{\"oneOf\":[{\"required\":[\"money\",\"points\"],\"properties\":{\"money\":{\"type\":\"integer\",\"format\":\"int64\"},\"points\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"},{\"type\":\"null\"}]},\"daily_networth\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}";
        }) = .absent,
        jobpoints: model.Presence(struct {
            jobs: struct {
                army: i64,
                casino: i64,
                education: i64,
                grocer: i64,
                law: i64,
                medical: i64,
                pub const json_schema = "{\"required\":[\"army\",\"casino\",\"education\",\"grocer\",\"law\",\"medical\"],\"properties\":{\"army\":{\"type\":\"integer\",\"format\":\"int32\"},\"casino\":{\"type\":\"integer\",\"format\":\"int32\"},\"education\":{\"type\":\"integer\",\"format\":\"int32\"},\"grocer\":{\"type\":\"integer\",\"format\":\"int32\"},\"law\":{\"type\":\"integer\",\"format\":\"int32\"},\"medical\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
            },
            companies: []const UserCompanyPoints,
            pub const json_schema = "{\"required\":[\"jobs\",\"companies\"],\"properties\":{\"jobs\":{\"required\":[\"army\",\"casino\",\"education\",\"grocer\",\"law\",\"medical\"],\"properties\":{\"army\":{\"type\":\"integer\",\"format\":\"int32\"},\"casino\":{\"type\":\"integer\",\"format\":\"int32\"},\"education\":{\"type\":\"integer\",\"format\":\"int32\"},\"grocer\":{\"type\":\"integer\",\"format\":\"int32\"},\"law\":{\"type\":\"integer\",\"format\":\"int32\"},\"medical\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"companies\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/UserCompanyPoints\"}}},\"type\":\"object\"}";
        }) = .absent,
        workstats: model.Presence(struct {
            endurance: i64,
            intelligence: i64,
            manual_labor: i64,
            total: i64,
            pub const json_schema = "{\"required\":[\"endurance\",\"intelligence\",\"manual_labor\",\"total\"],\"properties\":{\"endurance\":{\"type\":\"integer\",\"format\":\"int32\"},\"intelligence\":{\"type\":\"integer\",\"format\":\"int32\"},\"manual_labor\":{\"type\":\"integer\",\"format\":\"int32\"},\"total\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
        }) = .absent,
        skills: model.Presence([]const UserSkillDetail) = .absent,
        battlestats: model.Presence(struct {
            strength: UserBattleStatDetail,
            defense: UserBattleStatDetail,
            speed: UserBattleStatDetail,
            dexterity: UserBattleStatDetail,
            total: i64,
            pub const json_schema = "{\"required\":[\"strength\",\"defense\",\"speed\",\"dexterity\",\"total\"],\"properties\":{\"strength\":{\"$ref\":\"#/components/schemas/UserBattleStatDetail\"},\"defense\":{\"$ref\":\"#/components/schemas/UserBattleStatDetail\"},\"speed\":{\"$ref\":\"#/components/schemas/UserBattleStatDetail\"},\"dexterity\":{\"$ref\":\"#/components/schemas/UserBattleStatDetail\"},\"total\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}";
        }) = .absent,
        gym: model.Presence(struct {
            id: GymId,
            name: []const u8,
            pub const json_schema = "{\"required\":[\"id\",\"name\"],\"properties\":{\"id\":{\"$ref\":\"#/components/schemas/GymId\"},\"name\":{\"type\":\"string\"}},\"type\":\"object\"}";
        }) = .absent,
        trade: model.Presence(UserTradeDetailed) = .absent,
        trades: model.Presence([]const UserTrade) = .absent,
        events: model.Presence([]const UserEvent) = .absent,
        messages: model.Presence([]const UserMessage) = .absent,
        selections: model.Presence([]const UserSelectionName) = .absent,
        inventory: model.Presence(UserInventory) = .absent,
        timestamp: model.Presence(i64) = .absent,
        pub const json_schema = "{\"type\":\"object\",\"properties\":{\"crimes\":{\"$ref\":\"#/components/schemas/UserCrime\"},\"weaponexp\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/UserWeaponExp\"}},\"ammo\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/UserAmmo\"}},\"discord\":{\"required\":[\"discord_id\",\"user_id\"],\"properties\":{\"discord_id\":{\"$ref\":\"#/components/schemas/DiscordId\"},\"user_id\":{\"$ref\":\"#/components/schemas/UserId\"}},\"type\":\"object\"},\"races\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/UserRaceDetails\"}},\"_metadata\":{\"anyOf\":[{\"$ref\":\"#/components/schemas/RequestMetadataWithLinks\"},{\"$ref\":\"#/components/schemas/RequestMetadataWithLinksAndTotal\"}]},\"enlistedcars\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/UserRaceCarDetails\"}},\"forumPosts\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/ForumPost\"}},\"forumThreads\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/ForumThreadUserExtended\"}},\"forumSubscribedThreads\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/ForumSubscribedThread\"}},\"forumFeed\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/ForumFeed\"}},\"forumFriends\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/ForumFeed\"}},\"property\":{\"$ref\":\"#/components/schemas/UserPropertyDetails\"},\"reports\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/Report\"}},\"hof\":{\"$ref\":\"#/components/schemas/UserHofStats\"},\"calendar\":{\"$ref\":\"#/components/schemas/UserCalendar\"},\"racingrecords\":{\"type\":\"array\",\"items\":{\"required\":[\"track\",\"records\"],\"properties\":{\"track\":{\"required\":[\"id\",\"name\"],\"properties\":{\"id\":{\"$ref\":\"#/components/schemas/RaceTrackId\"},\"name\":{\"type\":\"string\"}},\"type\":\"object\"},\"records\":{\"type\":\"array\",\"items\":{\"required\":[\"car_id\",\"car_name\",\"lap_time\"],\"properties\":{\"car_id\":{\"$ref\":\"#/components/schemas/ItemId\"},\"car_name\":{\"type\":\"string\"},\"lap_time\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}}},\"type\":\"object\"}},\"education\":{\"$ref\":\"#/components/schemas/UserEducation\"},\"stocks\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/UserStock\"}},\"bounties\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/Bounty\"}},\"bounties_timestamp\":{\"type\":\"integer\",\"format\":\"int32\"},\"bounties_delay\":{\"description\":\"The minimum amount of time needed before the cache timestamp can change.\",\"type\":\"integer\",\"format\":\"int32\"},\"jobranks\":{\"$ref\":\"#/components/schemas/UserJobRanks\"},\"properties\":{\"type\":\"array\",\"items\":{\"oneOf\":[{\"$ref\":\"#/components/schemas/UserPropertyBasicDetails\"},{\"$ref\":\"#/components/schemas/UserPropertyDetailsExtended\"},{\"$ref\":\"#/components/schemas/UserPropertyDetailsExtendedRented\"},{\"$ref\":\"#/components/schemas/UserPropertyDetailsExtendedForRent\"},{\"$ref\":\"#/components/schemas/UserPropertyDetailsExtendedForSale\"}]}},\"factionBalance\":{\"oneOf\":[{\"$ref\":\"#/components/schemas/UserFactionBalance\"},{\"type\":\"null\"}]},\"profile\":{\"anyOf\":[{\"$ref\":\"#/components/schemas/UserBasic\"},{\"required\":[\"id\",\"name\",\"level\",\"rank\",\"title\",\"age\",\"signed_up\",\"faction_id\",\"honor_id\",\"property\",\"image\",\"gender\",\"revivable\",\"role\",\"status\",\"spouse\",\"awards\",\"friends\",\"enemies\",\"forum_posts\",\"karma\",\"last_action\",\"life\",\"donator_status\",\"revive_setting\"],\"properties\":{\"id\":{\"$ref\":\"#/components/schemas/UserId\"},\"name\":{\"type\":\"string\"},\"level\":{\"type\":\"integer\",\"format\":\"int32\"},\"rank\":{\"oneOf\":[{\"$ref\":\"#/components/schemas/UserRankEnum\"},{\"type\":\"string\"}]},\"title\":{\"oneOf\":[{\"$ref\":\"#/components/schemas/UserTitleEnum\"},{\"type\":\"string\"}]},\"donator_status\":{\"oneOf\":[{\"$ref\":\"#/components/schemas/UserDonatorStatusEnum\"},{\"type\":\"null\"}]},\"age\":{\"description\":\"Age in days.\",\"type\":\"integer\",\"format\":\"int32\"},\"signed_up\":{\"type\":\"integer\",\"format\":\"int32\"},\"faction_id\":{\"oneOf\":[{\"$ref\":\"#/components/schemas/FactionId\"},{\"type\":\"null\"}]},\"honor_id\":{\"$ref\":\"#/components/schemas/HonorId\"},\"revive_setting\":{\"$ref\":\"#/components/schemas/ReviveSetting\",\"description\":\"This field is shown only for 'Limited' or 'Full' access keys and only for the key owner, otherwise, the status is 'Unknown'.\"},\"property\":{\"required\":[\"id\",\"name\"],\"properties\":{\"id\":{\"$ref\":\"#/components/schemas/PropertyId\"},\"name\":{\"type\":\"string\"}},\"type\":\"object\"},\"image\":{\"oneOf\":[{\"type\":\"string\"},{\"type\":\"null\"}]},\"gender\":{\"$ref\":\"#/components/schemas/UserGenderEnum\"},\"revivable\":{\"type\":\"boolean\"},\"role\":{\"$ref\":\"#/components/schemas/UserRoleEnum\"},\"status\":{\"$ref\":\"#/components/schemas/UserStatus\"},\"spouse\":{\"oneOf\":[{\"$ref\":\"#/components/schemas/ProfileSpouse\"},{\"type\":\"null\"}]},\"awards\":{\"type\":\"integer\",\"format\":\"int32\"},\"friends\":{\"type\":\"integer\",\"format\":\"int32\"},\"enemies\":{\"type\":\"integer\",\"format\":\"int32\"},\"forum_posts\":{\"type\":\"integer\",\"format\":\"int32\"},\"karma\":{\"type\":\"integer\",\"format\":\"int32\"},\"last_action\":{\"$ref\":\"#/components/schemas/UserLastAction\"},\"life\":{\"required\":[\"current\",\"maximum\"],\"properties\":{\"current\":{\"type\":\"integer\",\"format\":\"int32\"},\"maximum\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}},\"type\":\"object\"}]},\"revives\":{\"anyOf\":[{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/Revive\"}},{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/ReviveSimplified\"}}]},\"honors\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/UserHonor\"}},\"medals\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/UserMedal\"}},\"merits\":{\"$ref\":\"#/components/schemas/UserMerits\"},\"job\":{\"oneOf\":[{\"$ref\":\"#/components/schemas/UserJob\"},{\"$ref\":\"#/components/schemas/UserCompany\"},{\"type\":\"null\"}]},\"faction\":{\"oneOf\":[{\"$ref\":\"#/components/schemas/UserFaction\"},{\"type\":\"null\"}]},\"competition\":{\"oneOf\":[{\"$ref\":\"#/components/schemas/UserCompetitionHalloween\"},{\"$ref\":\"#/components/schemas/UserCompetitionEasterEggs\"},{\"$ref\":\"#/components/schemas/UserCompetitionRps\"},{\"$ref\":\"#/components/schemas/UserCompetitionElimination\"}]},\"icons\":{\"oneOf\":[{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/UserIconPrivate\"}},{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/UserIconPublic\"}}]},\"itemmarket\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/UserItemMarketListing\"}},\"list\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/UserList\"}},\"equipment\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/UserEquipment\"}},\"clothing\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/UserClothing\"}},\"missions\":{\"required\":[\"credits\",\"givers\",\"rewards\"],\"properties\":{\"credits\":{\"type\":\"integer\",\"format\":\"int32\"},\"givers\":{\"type\":\"array\",\"items\":{\"required\":[\"id\",\"name\",\"contracts\"],\"properties\":{\"id\":{\"$ref\":\"#/components/schemas/UserId\"},\"name\":{\"type\":\"string\"},\"contracts\":{\"type\":\"array\",\"items\":{\"required\":[\"title\",\"difficulty\",\"status\",\"created_at\",\"started_at\",\"expires_at\",\"completed_at\",\"rewards\"],\"properties\":{\"title\":{\"type\":\"string\"},\"difficulty\":{\"$ref\":\"#/components/schemas/MissionDifficultyEnum\"},\"status\":{\"$ref\":\"#/components/schemas/MissionStatusEnum\"},\"created_at\":{\"type\":\"integer\",\"format\":\"int32\"},\"started_at\":{\"description\":\"Null if the status is 'Available'.\",\"oneOf\":[{\"type\":\"integer\",\"format\":\"int32\"},{\"type\":\"null\"}]},\"expires_at\":{\"description\":\"Null if the status is not 'Accepted'.\",\"oneOf\":[{\"type\":\"integer\",\"format\":\"int32\"},{\"type\":\"null\"}]},\"completed_at\":{\"description\":\"Null if the status is not 'Failed' or 'Completed'.\",\"oneOf\":[{\"type\":\"integer\",\"format\":\"int32\"},{\"type\":\"null\"}]},\"rewards\":{\"description\":\"Null if the status is not 'Completed'.\",\"oneOf\":[{\"required\":[\"money\",\"credits\"],\"properties\":{\"money\":{\"type\":\"integer\",\"format\":\"int32\"},\"credits\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},{\"type\":\"null\"}]}},\"type\":\"object\"}}},\"type\":\"object\"}},\"rewards\":{\"type\":\"array\",\"items\":{\"required\":[\"type\",\"details\",\"amount\",\"cost\",\"expires_at\"],\"properties\":{\"type\":{\"oneOf\":[{\"$ref\":\"#/components/schemas/MissionRewardUpgrade\"},{\"type\":\"string\"}]},\"details\":{\"description\":\"The response depends on the 'type' value.\",\"oneOf\":[{\"$ref\":\"#/components/schemas/MissionRewardDetailsAmmo\"},{\"$ref\":\"#/components/schemas/MissionRewardDetailsUpgrade\"},{\"$ref\":\"#/components/schemas/MissionRewardDetailsItem\"}]},\"amount\":{\"type\":\"integer\",\"format\":\"int32\"},\"cost\":{\"type\":\"integer\",\"format\":\"int32\"},\"expires_at\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}}},\"type\":\"object\"},\"personalstats\":{\"anyOf\":[{\"allOf\":[{\"$ref\":\"#/components/schemas/PersonalStatsAttackingExtended\"},{\"$ref\":\"#/components/schemas/PersonalStatsBattleStats\"},{\"$ref\":\"#/components/schemas/PersonalStatsJobsExtended\"},{\"$ref\":\"#/components/schemas/PersonalStatsTrading\"},{\"$ref\":\"#/components/schemas/PersonalStatsJail\"},{\"$ref\":\"#/components/schemas/PersonalStatsHospital\"},{\"$ref\":\"#/components/schemas/PersonalStatsFinishingHits\"},{\"$ref\":\"#/components/schemas/PersonalStatsCommunication\"},{\"$ref\":\"#/components/schemas/PersonalStatsCrimes\"},{\"$ref\":\"#/components/schemas/PersonalStatsBounties\"},{\"$ref\":\"#/components/schemas/PersonalStatsInvestments\"},{\"$ref\":\"#/components/schemas/PersonalStatsItems\"},{\"$ref\":\"#/components/schemas/PersonalStatsTravel\"},{\"$ref\":\"#/components/schemas/PersonalStatsDrugs\"},{\"$ref\":\"#/components/schemas/PersonalStatsMissions\"},{\"$ref\":\"#/components/schemas/PersonalStatsRacing\"},{\"$ref\":\"#/components/schemas/PersonalStatsNetworthExtended\"},{\"$ref\":\"#/components/schemas/PersonalStatsOther\"}]},{\"allOf\":[{\"$ref\":\"#/components/schemas/PersonalStatsAttackingPublic\"},{\"$ref\":\"#/components/schemas/PersonalStatsJobsPublic\"},{\"$ref\":\"#/components/schemas/PersonalStatsTrading\"},{\"$ref\":\"#/components/schemas/PersonalStatsJail\"},{\"$ref\":\"#/components/schemas/PersonalStatsHospital\"},{\"$ref\":\"#/components/schemas/PersonalStatsFinishingHits\"},{\"$ref\":\"#/components/schemas/PersonalStatsCommunication\"},{\"$ref\":\"#/components/schemas/PersonalStatsCrimes\"},{\"$ref\":\"#/components/schemas/PersonalStatsBounties\"},{\"$ref\":\"#/components/schemas/PersonalStatsItems\"},{\"$ref\":\"#/components/schemas/PersonalStatsTravel\"},{\"$ref\":\"#/components/schemas/PersonalStatsDrugs\"},{\"$ref\":\"#/components/schemas/PersonalStatsMissions\"},{\"$ref\":\"#/components/schemas/PersonalStatsRacing\"},{\"$ref\":\"#/components/schemas/PersonalStatsNetworthPublic\"},{\"$ref\":\"#/components/schemas/PersonalStatsOther\"}]},{\"allOf\":[{\"$ref\":\"#/components/schemas/PersonalStatsAttackingPopular\"},{\"$ref\":\"#/components/schemas/PersonalStatsJobsPublic\"},{\"$ref\":\"#/components/schemas/PersonalStatsHospitalPopular\"},{\"$ref\":\"#/components/schemas/PersonalStatsCrimesPopular\"},{\"$ref\":\"#/components/schemas/PersonalStatsItemsPopular\"},{\"$ref\":\"#/components/schemas/PersonalStatsTravelPopular\"},{\"$ref\":\"#/components/schemas/PersonalStatsDrugs\"},{\"$ref\":\"#/components/schemas/PersonalStatsNetworthPublic\"},{\"$ref\":\"#/components/schemas/PersonalStatsOtherPopular\"}]},{\"oneOf\":[{\"$ref\":\"#/components/schemas/PersonalStatsAttackingPublic\"},{\"$ref\":\"#/components/schemas/PersonalStatsJobsPublic\"},{\"$ref\":\"#/components/schemas/PersonalStatsTrading\"},{\"$ref\":\"#/components/schemas/PersonalStatsJail\"},{\"$ref\":\"#/components/schemas/PersonalStatsHospital\"},{\"$ref\":\"#/components/schemas/PersonalStatsFinishingHits\"},{\"$ref\":\"#/components/schemas/PersonalStatsCommunication\"},{\"$ref\":\"#/components/schemas/PersonalStatsCrimes\"},{\"$ref\":\"#/components/schemas/PersonalStatsBounties\"},{\"$ref\":\"#/components/schemas/PersonalStatsItems\"},{\"$ref\":\"#/components/schemas/PersonalStatsTravel\"},{\"$ref\":\"#/components/schemas/PersonalStatsDrugs\"},{\"$ref\":\"#/components/schemas/PersonalStatsMissions\"},{\"$ref\":\"#/components/schemas/PersonalStatsRacing\"},{\"$ref\":\"#/components/schemas/PersonalStatsNetworthPublic\"},{\"$ref\":\"#/components/schemas/PersonalStatsOther\"}]},{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/PersonalStatsHistoricStat\"}}]},\"organizedCrime\":{\"oneOf\":[{\"$ref\":\"#/components/schemas/FactionCrime\"},{\"$ref\":\"#/components/schemas/UserOrganizedCrimeError\"},{\"type\":\"null\"}]},\"itemmods\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/UserItemMod\"}},\"attacks\":{\"anyOf\":[{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/Attack\"}},{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/AttackSimplified\"}}]},\"bars\":{\"$ref\":\"#/components/schemas/UserBars\"},\"cooldowns\":{\"required\":[\"drug\",\"medical\",\"booster\"],\"properties\":{\"drug\":{\"type\":\"integer\",\"format\":\"int32\"},\"medical\":{\"type\":\"integer\",\"format\":\"int32\"},\"booster\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"notifications\":{\"required\":[\"messages\",\"events\",\"awards\",\"competition\"],\"properties\":{\"messages\":{\"type\":\"integer\",\"format\":\"int32\"},\"events\":{\"type\":\"integer\",\"format\":\"int32\"},\"awards\":{\"type\":\"integer\",\"format\":\"int32\"},\"competition\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"perks\":{\"required\":[\"faction\",\"job\",\"property\",\"education\",\"enhancer\",\"book\",\"stock\",\"merit\"],\"properties\":{\"faction\":{\"type\":\"array\",\"items\":{\"type\":\"string\"}},\"job\":{\"type\":\"array\",\"items\":{\"type\":\"string\"}},\"property\":{\"type\":\"array\",\"items\":{\"type\":\"string\"}},\"education\":{\"type\":\"array\",\"items\":{\"type\":\"string\"}},\"enhancer\":{\"type\":\"array\",\"items\":{\"type\":\"string\"}},\"book\":{\"type\":\"array\",\"items\":{\"type\":\"string\"}},\"stock\":{\"type\":\"array\",\"items\":{\"type\":\"string\"}},\"merit\":{\"type\":\"array\",\"items\":{\"type\":\"string\"}}},\"type\":\"object\"},\"refills\":{\"required\":[\"energy\",\"nerve\",\"token\",\"special_count\"],\"properties\":{\"energy\":{\"type\":\"boolean\"},\"nerve\":{\"type\":\"boolean\"},\"token\":{\"type\":\"boolean\"},\"special_count\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"travel\":{\"required\":[\"destination\",\"method\",\"departed_at\",\"arrival_at\",\"time_left\"],\"properties\":{\"destination\":{\"$ref\":\"#/components/schemas/CountryEnum\"},\"method\":{\"description\":\"Null if the player has never flown before.\",\"oneOf\":[{\"$ref\":\"#/components/schemas/UserFlyMethodEnum\"},{\"type\":\"null\"}]},\"departed_at\":{\"description\":\"Null if the player has never flown before.\",\"oneOf\":[{\"type\":\"integer\",\"format\":\"int32\"},{\"type\":\"null\"}]},\"arrival_at\":{\"description\":\"Null if the player has never flown before.\",\"oneOf\":[{\"type\":\"integer\",\"format\":\"int32\"},{\"type\":\"null\"}]},\"time_left\":{\"description\":\"Time left in seconds.\",\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"virus\":{\"description\":\"Null if the player is currently not programming a virus.\",\"oneOf\":[{\"$ref\":\"#/components/schemas/UserVirus\"},{\"type\":\"null\"}]},\"casino\":{\"required\":[\"tokens\",\"streak\"],\"properties\":{\"tokens\":{\"type\":\"integer\",\"format\":\"int32\"},\"streak\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"},\"halloween\":{\"$ref\":\"#/components/schemas/UserHalloween\"},\"networth\":{\"required\":[\"money\",\"items\",\"assets\",\"points\",\"total\",\"timestamp\"],\"properties\":{\"money\":{\"required\":[\"pending\",\"wallet\",\"vault\",\"bookie\",\"city_bank\",\"cayman_bank\",\"piggy_bank\",\"loans\",\"unpaid_fees\"],\"properties\":{\"pending\":{\"type\":\"integer\",\"format\":\"int64\"},\"wallet\":{\"type\":\"integer\",\"format\":\"int64\"},\"vault\":{\"type\":\"integer\",\"format\":\"int64\"},\"bookie\":{\"type\":\"integer\",\"format\":\"int64\"},\"city_bank\":{\"type\":\"integer\",\"format\":\"int64\"},\"cayman_bank\":{\"type\":\"integer\",\"format\":\"int64\"},\"piggy_bank\":{\"type\":\"integer\",\"format\":\"int64\"},\"loans\":{\"type\":\"integer\",\"format\":\"int64\"},\"unpaid_fees\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"},\"items\":{\"required\":[\"inventory\",\"display_case\",\"bazaar\",\"trades\",\"item_market\",\"auction_house\",\"enlisted_cars\"],\"properties\":{\"inventory\":{\"type\":\"integer\",\"format\":\"int64\"},\"display_case\":{\"type\":\"integer\",\"format\":\"int64\"},\"bazaar\":{\"type\":\"integer\",\"format\":\"int64\"},\"trades\":{\"type\":\"integer\",\"format\":\"int64\"},\"item_market\":{\"type\":\"integer\",\"format\":\"int64\"},\"auction_house\":{\"type\":\"integer\",\"format\":\"int64\"},\"enlisted_cars\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"},\"assets\":{\"required\":[\"property\",\"stock_market\",\"company\"],\"properties\":{\"property\":{\"type\":\"integer\",\"format\":\"int64\"},\"stock_market\":{\"type\":\"integer\",\"format\":\"int64\"},\"company\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"},\"points\":{\"type\":\"integer\",\"format\":\"int64\"},\"total\":{\"type\":\"integer\",\"format\":\"int64\"},\"timestamp\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"money\":{\"required\":[\"points\",\"wallet\",\"company\",\"vault\",\"cayman_bank\",\"city_bank\",\"faction\",\"daily_networth\"],\"properties\":{\"points\":{\"type\":\"integer\",\"format\":\"int64\"},\"wallet\":{\"type\":\"integer\",\"format\":\"int64\"},\"company\":{\"type\":\"integer\",\"format\":\"int64\"},\"vault\":{\"type\":\"integer\",\"format\":\"int64\"},\"cayman_bank\":{\"type\":\"integer\",\"format\":\"int64\"},\"city_bank\":{\"oneOf\":[{\"required\":[\"amount\",\"profit\",\"duration\",\"interest_rate\",\"until\",\"invested_at\"],\"properties\":{\"amount\":{\"type\":\"integer\",\"format\":\"int64\"},\"profit\":{\"type\":\"integer\",\"format\":\"int64\"},\"duration\":{\"description\":\"Initial duration in days.\",\"type\":\"integer\",\"format\":\"int32\"},\"interest_rate\":{\"type\":\"number\",\"format\":\"float\"},\"until\":{\"type\":\"integer\",\"format\":\"int64\"},\"invested_at\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},{\"type\":\"null\"}]},\"faction\":{\"oneOf\":[{\"required\":[\"money\",\"points\"],\"properties\":{\"money\":{\"type\":\"integer\",\"format\":\"int64\"},\"points\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"},{\"type\":\"null\"}]},\"daily_networth\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"},\"jobpoints\":{\"required\":[\"jobs\",\"companies\"],\"properties\":{\"jobs\":{\"required\":[\"army\",\"casino\",\"education\",\"grocer\",\"law\",\"medical\"],\"properties\":{\"army\":{\"type\":\"integer\",\"format\":\"int32\"},\"casino\":{\"type\":\"integer\",\"format\":\"int32\"},\"education\":{\"type\":\"integer\",\"format\":\"int32\"},\"grocer\":{\"type\":\"integer\",\"format\":\"int32\"},\"law\":{\"type\":\"integer\",\"format\":\"int32\"},\"medical\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"companies\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/UserCompanyPoints\"}}},\"type\":\"object\"},\"workstats\":{\"required\":[\"endurance\",\"intelligence\",\"manual_labor\",\"total\"],\"properties\":{\"endurance\":{\"type\":\"integer\",\"format\":\"int32\"},\"intelligence\":{\"type\":\"integer\",\"format\":\"int32\"},\"manual_labor\":{\"type\":\"integer\",\"format\":\"int32\"},\"total\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"},\"skills\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/UserSkillDetail\"}},\"battlestats\":{\"required\":[\"strength\",\"defense\",\"speed\",\"dexterity\",\"total\"],\"properties\":{\"strength\":{\"$ref\":\"#/components/schemas/UserBattleStatDetail\"},\"defense\":{\"$ref\":\"#/components/schemas/UserBattleStatDetail\"},\"speed\":{\"$ref\":\"#/components/schemas/UserBattleStatDetail\"},\"dexterity\":{\"$ref\":\"#/components/schemas/UserBattleStatDetail\"},\"total\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"},\"gym\":{\"required\":[\"id\",\"name\"],\"properties\":{\"id\":{\"$ref\":\"#/components/schemas/GymId\"},\"name\":{\"type\":\"string\"}},\"type\":\"object\"},\"trade\":{\"$ref\":\"#/components/schemas/UserTradeDetailed\"},\"trades\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/UserTrade\"}},\"events\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/UserEvent\"}},\"messages\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/UserMessage\"}},\"selections\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/UserSelectionName\"}},\"inventory\":{\"$ref\":\"#/components/schemas/UserInventory\"},\"timestamp\":{\"type\":\"integer\",\"format\":\"int32\"}}}";
    };
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"User\"],\"summary\":\"Get any User selection\",\"description\":\"Key access level depends on the required selections. <br>Choose one or more selections (comma separated).\",\"operationId\":\"getUserGeneric\",\"parameters\":[{\"name\":\"selections\",\"in\":\"query\",\"description\":\"Selection names\",\"required\":false,\"style\":\"form\",\"explode\":false,\"schema\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/UserSelectionName\"}}},{\"name\":\"id\",\"in\":\"query\",\"description\":\"selection id\",\"required\":false,\"schema\":{\"oneOf\":[{\"$ref\":\"#/components/schemas/UserDiscordPathId\"},{\"$ref\":\"#/components/schemas/TornCrimeId\"},{\"$ref\":\"#/components/schemas/TradeId\"},{\"type\":\"string\"}]}},{\"name\":\"legacy\",\"in\":\"query\",\"description\":\"Legacy selection names for which you want or expect API v1 response\",\"required\":false,\"style\":\"form\",\"explode\":false,\"schema\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/UserSelectionName\"}}},{\"$ref\":\"#/components/parameters/ApiLimit\"},{\"$ref\":\"#/components/parameters/ApiFrom\"},{\"$ref\":\"#/components/parameters/ApiTo\"},{\"$ref\":\"#/components/parameters/ApiSort\"},{\"name\":\"cat\",\"in\":\"query\",\"description\":\"Selection category. Can belong to one of the specified types.\",\"required\":false,\"schema\":{\"oneOf\":[{\"$ref\":\"#/components/schemas/ReportTypeEnum\"},{\"$ref\":\"#/components/schemas/UserListEnum\"},{\"$ref\":\"#/components/schemas/PersonalStatsCategoryEnum\"},{\"$ref\":\"#/components/schemas/RacingRaceTypeEnum\"},{\"$ref\":\"#/components/schemas/TornInventoryItemType\"},{\"$ref\":\"#/components/schemas/TradeCategoryEnum\"}]}},{\"name\":\"stat\",\"in\":\"query\",\"description\":\"Selection stat\",\"required\":false,\"style\":\"form\",\"explode\":false,\"schema\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/PersonalStatsStatName\"}}},{\"$ref\":\"#/components/parameters/ApiFiltersUser\"},{\"$ref\":\"#/components/parameters/ApiStripTags\"},{\"$ref\":\"#/components/parameters/ApiOffsetNoDefault\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"anyOf\":[{\"$ref\":\"#/components/schemas/UserCrimesResponse\"},{\"$ref\":\"#/components/schemas/UserWeaponExpResponse\"},{\"$ref\":\"#/components/schemas/UserAmmoResponse\"},{\"$ref\":\"#/components/schemas/UserDiscordResponse\"},{\"$ref\":\"#/components/schemas/UserRacesResponse\"},{\"$ref\":\"#/components/schemas/UserEnlistedCarsResponse\"},{\"$ref\":\"#/components/schemas/UserForumPostsResponse\"},{\"$ref\":\"#/components/schemas/UserForumThreadsResponse\"},{\"$ref\":\"#/components/schemas/UserForumSubscribedThreadsResponse\"},{\"$ref\":\"#/components/schemas/UserForumFeedResponse\"},{\"$ref\":\"#/components/schemas/UserForumFriendsResponse\"},{\"$ref\":\"#/components/schemas/UserPropertyResponse\"},{\"$ref\":\"#/components/schemas/ReportsResponse\"},{\"$ref\":\"#/components/schemas/UserHofResponse\"},{\"$ref\":\"#/components/schemas/UserCalendarResponse\"},{\"$ref\":\"#/components/schemas/UserRacingRecordsResponse\"},{\"$ref\":\"#/components/schemas/UserEducationResponse\"},{\"$ref\":\"#/components/schemas/UserStocksResponse\"},{\"$ref\":\"#/components/schemas/UserBountiesResponse\"},{\"$ref\":\"#/components/schemas/UserJobRanksResponse\"},{\"$ref\":\"#/components/schemas/UserPropertiesResponse\"},{\"$ref\":\"#/components/schemas/UserFactionBalanceResponse\"},{\"$ref\":\"#/components/schemas/UserBasicResponse\"},{\"$ref\":\"#/components/schemas/RevivesResponse\"},{\"$ref\":\"#/components/schemas/UserHonorsResponse\"},{\"$ref\":\"#/components/schemas/UserMedalsResponse\"},{\"$ref\":\"#/components/schemas/UserMeritsResponse\"},{\"$ref\":\"#/components/schemas/RevivesFullResponse\"},{\"$ref\":\"#/components/schemas/UserProfileResponse\"},{\"$ref\":\"#/components/schemas/UserJobResponse\"},{\"$ref\":\"#/components/schemas/UserFactionResponse\"},{\"$ref\":\"#/components/schemas/UserCompetitionResponse\"},{\"$ref\":\"#/components/schemas/UserIconsResponse\"},{\"$ref\":\"#/components/schemas/UserItemMarketResponse\"},{\"$ref\":\"#/components/schemas/UserListResponse\"},{\"$ref\":\"#/components/schemas/UserEquipmentResponse\"},{\"$ref\":\"#/components/schemas/UserMissionsResponse\"},{\"$ref\":\"#/components/schemas/UserPersonalStatsResponse\"},{\"$ref\":\"#/components/schemas/UserOrganizedCrimeResponse\"},{\"$ref\":\"#/components/schemas/UserItemModsResponse\"},{\"$ref\":\"#/components/schemas/AttacksResponse\"},{\"$ref\":\"#/components/schemas/UserBarsResponse\"},{\"$ref\":\"#/components/schemas/UserCooldownsResponse\"},{\"$ref\":\"#/components/schemas/UserNotificationsResponse\"},{\"$ref\":\"#/components/schemas/UserPerksResponse\"},{\"$ref\":\"#/components/schemas/UserRefillsResponse\"},{\"$ref\":\"#/components/schemas/UserTravelResponse\"},{\"$ref\":\"#/components/schemas/UserVirusResponse\"},{\"$ref\":\"#/components/schemas/AttacksFullResponse\"},{\"$ref\":\"#/components/schemas/UserCasinoResponse\"},{\"$ref\":\"#/components/schemas/UserHalloweenResponse\"},{\"$ref\":\"#/components/schemas/UserNetworthResponse\"},{\"$ref\":\"#/components/schemas/UserMoneyResponse\"},{\"$ref\":\"#/components/schemas/UserJobPointsResponse\"},{\"$ref\":\"#/components/schemas/UserWorkStatsResponse\"},{\"$ref\":\"#/components/schemas/UserSkillsResponse\"},{\"$ref\":\"#/components/schemas/UserBattleStatsResponse\"},{\"$ref\":\"#/components/schemas/UserGymResponse\"},{\"$ref\":\"#/components/schemas/UserTradeResponse\"},{\"$ref\":\"#/components/schemas/UserTradesResponse\"},{\"$ref\":\"#/components/schemas/UserNewEventsResponse\"},{\"$ref\":\"#/components/schemas/UserEventsResponse\"},{\"$ref\":\"#/components/schemas/UserMessagesResponse\"},{\"$ref\":\"#/components/schemas/UserNewMessagesResponse\"},{\"$ref\":\"#/components/schemas/UserLookupResponse\"},{\"$ref\":\"#/components/schemas/UserInventoryResponse\"},{\"$ref\":\"#/components/schemas/TimestampResponse\"}]}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyFactionApplications = struct {
    pub const operation_id = "getMyFactionApplications";
    pub const path = "/faction/applications";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = FactionApplicationsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Faction\"],\"summary\":\"Get your faction's applications\",\"description\":\"Requires minimal access key with faction API access permissions. <br>\",\"operationId\":\"getMyFactionApplications\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyMinimal\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/FactionApplicationsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyFactionAttacks = struct {
    pub const operation_id = "getMyFactionAttacks";
    pub const path = "/faction/attacks";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        filters: model.Presence([]const ApiFiltersAttacksRevivesEnum) = .absent,
        limit: model.Presence(i64) = .absent,
        sort: model.Presence(enum {
            DESC,
            ASC,
        }) = .absent,
        to: model.Presence(i64) = .absent,
        from: model.Presence(i64) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = AttacksResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Faction\"],\"summary\":\"Get your faction's detailed attacks\",\"description\":\"Requires limited access key with faction API access permissions. <br>\",\"operationId\":\"getMyFactionAttacks\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiFiltersIncomingOutgoing\"},{\"$ref\":\"#/components/parameters/ApiLimit100\"},{\"$ref\":\"#/components/parameters/ApiSortDesc\"},{\"$ref\":\"#/components/parameters/ApiTo\"},{\"$ref\":\"#/components/parameters/ApiFrom\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyLimited\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/AttacksResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyFactionAttacksSimplified = struct {
    pub const operation_id = "getMyFactionAttacksSimplified";
    pub const path = "/faction/attacksfull";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        filters: model.Presence([]const ApiFiltersAttacksRevivesEnum) = .absent,
        limit: model.Presence(i64) = .absent,
        sort: model.Presence(enum {
            DESC,
            ASC,
        }) = .absent,
        to: model.Presence(i64) = .absent,
        from: model.Presence(i64) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = AttacksFullResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Faction\"],\"summary\":\"Get your faction's simplified attacks\",\"description\":\"Requires limited access key with faction API access permissions. <br>\",\"operationId\":\"getMyFactionAttacksSimplified\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiFiltersIncomingOutgoing\"},{\"$ref\":\"#/components/parameters/ApiLimit1000\"},{\"$ref\":\"#/components/parameters/ApiSortDesc\"},{\"$ref\":\"#/components/parameters/ApiTo\"},{\"$ref\":\"#/components/parameters/ApiFrom\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyLimited\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/AttacksFullResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyFactionBalance = struct {
    pub const operation_id = "getMyFactionBalance";
    pub const path = "/faction/balance";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        cat: model.Presence(enum {
            all,
            current,
        }) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = FactionBalanceResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Faction\"],\"summary\":\"Get your faction's & member's balance details\",\"description\":\"Requires limited access key with faction API access permissions. <br>\",\"operationId\":\"getMyFactionBalance\",\"parameters\":[{\"name\":\"cat\",\"in\":\"query\",\"description\":\"By default, this selection will return only current faction's member balances, and the option 'all' will return all current members balances + additionally those of ex-members which do have money or points on their balance.\",\"required\":false,\"schema\":{\"type\":\"string\",\"enum\":[\"all\",\"current\"]}},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyLimited\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/FactionBalanceResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyFactionBasicInformation = struct {
    pub const operation_id = "getMyFactionBasicInformation";
    pub const path = "/faction/basic";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = FactionBasicResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Faction\"],\"summary\":\"Get your faction's basic details\",\"description\":\"Requires public access key. <br> The 'is_enlisted' value will be populated if you have API faction permissions (with custom, limited or full access keys), otherwise it will be set as null.\",\"operationId\":\"getMyFactionBasicInformation\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/FactionBasicResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getFactionBasicInformation = struct {
    pub const operation_id = "getFactionBasicInformation";
    pub const path = "/faction/{id}/basic";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        id: FactionId,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = FactionBasicResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Faction\"],\"summary\":\"Get a faction's basic details\",\"description\":\"Requires public access key. <br> The 'is_enlisted' value will be populated if you're requesting data for your faction and have faction permissions (with custom, limited or full access keys), otherwise it will be set as null.\",\"operationId\":\"getFactionBasicInformation\",\"parameters\":[{\"name\":\"id\",\"in\":\"path\",\"description\":\"Faction id\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/FactionId\"}},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/FactionBasicResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyFactionChain = struct {
    pub const operation_id = "getMyFactionChain";
    pub const path = "/faction/chain";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = FactionOngoingChainResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Faction\"],\"summary\":\"Get your faction's current chain\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getMyFactionChain\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/FactionOngoingChainResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getFactionChain = struct {
    pub const operation_id = "getFactionChain";
    pub const path = "/faction/{id}/chain";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        id: FactionId,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = FactionOngoingChainResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Faction\"],\"summary\":\"Get a faction's current chain\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getFactionChain\",\"parameters\":[{\"name\":\"id\",\"in\":\"path\",\"description\":\"Faction id\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/FactionId\"}},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/FactionOngoingChainResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyFactionCompletedChains = struct {
    pub const operation_id = "getMyFactionCompletedChains";
    pub const path = "/faction/chains";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        limit: model.Presence(i64) = .absent,
        sort: model.Presence(enum {
            DESC,
            ASC,
        }) = .absent,
        to: model.Presence(i64) = .absent,
        from: model.Presence(i64) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = FactionChainsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Faction\"],\"summary\":\"Get a list of your faction's completed chains\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getMyFactionCompletedChains\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiLimit100\"},{\"$ref\":\"#/components/parameters/ApiSortDesc\"},{\"$ref\":\"#/components/parameters/ApiTo\"},{\"$ref\":\"#/components/parameters/ApiFrom\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/FactionChainsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getFactionCompletedChains = struct {
    pub const operation_id = "getFactionCompletedChains";
    pub const path = "/faction/{id}/chains";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        id: FactionId,
        limit: model.Presence(i64) = .absent,
        sort: model.Presence(enum {
            DESC,
            ASC,
        }) = .absent,
        to: model.Presence(i64) = .absent,
        from: model.Presence(i64) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = FactionChainsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Faction\"],\"summary\":\"Get a list of a faction's completed chains\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getFactionCompletedChains\",\"parameters\":[{\"name\":\"id\",\"in\":\"path\",\"description\":\"Faction id\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/FactionId\"}},{\"$ref\":\"#/components/parameters/ApiLimit100\"},{\"$ref\":\"#/components/parameters/ApiSortDesc\"},{\"$ref\":\"#/components/parameters/ApiTo\"},{\"$ref\":\"#/components/parameters/ApiFrom\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/FactionChainsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyFactionLatestChainReport = struct {
    pub const operation_id = "getMyFactionLatestChainReport";
    pub const path = "/faction/chainreport";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = FactionChainReportResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Faction\"],\"summary\":\"Get your faction's latest chain report\",\"description\":\"Requires public access key. <br> This includes currently ongoing chains.\",\"operationId\":\"getMyFactionLatestChainReport\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/FactionChainReportResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getChainReport = struct {
    pub const operation_id = "getChainReport";
    pub const path = "/faction/{chainId}/chainreport";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        chainId: ChainId,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = FactionChainReportResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Faction\"],\"summary\":\"Get a chain report\",\"description\":\"Requires public access key. <br> Chain reports for ongoing chains are available only for your own faction.\",\"operationId\":\"getChainReport\",\"parameters\":[{\"name\":\"chainId\",\"in\":\"path\",\"description\":\"Chain id\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/ChainId\"}},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/FactionChainReportResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyFactionContributors = struct {
    pub const operation_id = "getMyFactionContributors";
    pub const path = "/faction/contributors";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        stat: FactionStatEnum,
        cat: model.Presence(enum {
            all,
            current,
        }) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = FactionContributorsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Faction\"],\"summary\":\"Get your faction's challenge contributors\",\"description\":\"Requires limiteed access key with faction API access permissions. <br>\",\"operationId\":\"getMyFactionContributors\",\"parameters\":[{\"name\":\"stat\",\"in\":\"query\",\"description\":\"Get contributors for this field.\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/FactionStatEnum\"}},{\"name\":\"cat\",\"in\":\"query\",\"description\":\"By default, this selection will return only current faction's member contributions, and the option 'all' will return all contributors.\",\"required\":false,\"schema\":{\"type\":\"string\",\"enum\":[\"all\",\"current\"]}},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyLimited\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/FactionContributorsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyFactionCrimeExp = struct {
    pub const operation_id = "getMyFactionCrimeExp";
    pub const path = "/faction/crimeexp";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = FactionCrimeExpResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Faction\"],\"summary\":\"Get your faction members crime experience\",\"description\":\"Requires minimal access key. <br>Members are ordered descending, from highest crime experience to lowest.\",\"operationId\":\"getMyFactionCrimeExp\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyMinimal\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/FactionCrimeExpResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyFactionOrganizedCrimes = struct {
    pub const operation_id = "getMyFactionOrganizedCrimes";
    pub const path = "/faction/crimes";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        cat: model.Presence(enum {
            all,
            recruiting,
            planning,
            failure,
            successful,
            expired,
            available,
            completed,
        }) = .absent,
        filters: model.Presence(enum {
            created_at,
            executed_at,
            ready_at,
            expired_at,
        }) = .absent,
        limit: model.Presence(i64) = .absent,
        offset: model.Presence(i64) = .absent,
        from: model.Presence(i64) = .absent,
        to: model.Presence(i64) = .absent,
        sort: model.Presence(enum {
            DESC,
            ASC,
        }) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = FactionCrimesResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Faction\"],\"summary\":\"Get your faction's organized crimes\",\"description\":\"Requires minimal access key with faction API access permissions. <br> It's possible to get older entries either by timestamp range (from, to) or with offset.<br> Crimes are ordered depending on the category chosen:\\n * For categories 'all' & 'available', the ordering field is 'created_at'.\\n * For categories 'successful', 'failed' & 'completed', the ordering field is 'executed_at'.\\n * For categories 'recruiting' & 'expired', the ordering field is 'expired_at'.\\n * For category 'planning', the ordering field is 'ready_at'.\",\"operationId\":\"getMyFactionOrganizedCrimes\",\"parameters\":[{\"name\":\"cat\",\"in\":\"query\",\"description\":\"Category of organized crimes returned. Category 'available' includes both 'recruiting' & 'planning', and category 'completed' includes both 'successful' & 'failure'<br>Default category is 'all'.\",\"required\":false,\"schema\":{\"type\":\"string\",\"enum\":[\"all\",\"recruiting\",\"planning\",\"failure\",\"successful\",\"expired\",\"available\",\"completed\"]}},{\"name\":\"filters\",\"in\":\"query\",\"description\":\"It's possible to set this parameter to specify a field used for the sort, from & to query parameters. If not specified, the field will default to the category sorting as described above.\",\"required\":false,\"schema\":{\"type\":\"string\",\"enum\":[\"created_at\",\"executed_at\",\"ready_at\",\"expired_at\"]}},{\"$ref\":\"#/components/parameters/ApiLimit100Default20\"},{\"$ref\":\"#/components/parameters/ApiOffset\"},{\"$ref\":\"#/components/parameters/ApiFrom\"},{\"$ref\":\"#/components/parameters/ApiTo\"},{\"$ref\":\"#/components/parameters/ApiSortDesc\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyMinimal\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/FactionCrimesResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyFactionOrganizedCrime = struct {
    pub const operation_id = "getMyFactionOrganizedCrime";
    pub const path = "/faction/{crimeId}/crime";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        crimeId: FactionCrimeId,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = FactionCrimeResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Faction\"],\"summary\":\"Get a specific organized crime\",\"description\":\"Requires minimal access key with faction API access permissions. <br>\",\"operationId\":\"getMyFactionOrganizedCrime\",\"parameters\":[{\"name\":\"crimeId\",\"in\":\"path\",\"description\":\"Crime id\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/FactionCrimeId\"}},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyMinimal\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/FactionCrimeResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getWarfareDirtyBombs = struct {
    pub const operation_id = "getWarfareDirtyBombs";
    pub const path = "/faction/dirtybombs";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = FactionWarfareDirtyBombsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Faction\"],\"summary\":\"Get all dirty bombs\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getWarfareDirtyBombs\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/FactionWarfareDirtyBombsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyFactionHoF = struct {
    pub const operation_id = "getMyFactionHoF";
    pub const path = "/faction/hof";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = FactionHofResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Faction\"],\"summary\":\"Get your faction's hall of fame rankings.\",\"description\":\"Requires public access key. <br> \",\"operationId\":\"getMyFactionHoF\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/FactionHofResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getFactionHoF = struct {
    pub const operation_id = "getFactionHoF";
    pub const path = "/faction/{id}/hof";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        id: FactionId,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = FactionHofResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Faction\"],\"summary\":\"Get a faction's hall of fame rankings.\",\"description\":\"Requires public access key. <br> \",\"operationId\":\"getFactionHoF\",\"parameters\":[{\"name\":\"id\",\"in\":\"path\",\"description\":\"Faction id\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/FactionId\"}},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/FactionHofResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyFactionInventory = struct {
    pub const operation_id = "getMyFactionInventory";
    pub const path = "/faction/inventory";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = 300;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        cat: FactionArmoryCategoryEnum,
        limit: model.Presence(i64) = .absent,
        offset: model.Presence(i64) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = FactionInventoryResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Faction\"],\"summary\":\"Get your faction's inventory items.\",\"description\":\"<b>Cached selection (5 minutes, all items cached at once).</b><br><br>Requires limited access key. <br> \",\"operationId\":\"getMyFactionInventory\",\"parameters\":[{\"name\":\"cat\",\"in\":\"query\",\"description\":\"Armory category\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/FactionArmoryCategoryEnum\"}},{\"$ref\":\"#/components/parameters/ApiLimit100Default20\"},{\"$ref\":\"#/components/parameters/ApiOffset\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyLimited\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/FactionInventoryResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyFactionMembers = struct {
    pub const operation_id = "getMyFactionMembers";
    pub const path = "/faction/members";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        striptags: model.Presence(enum {
            true,
            false,
        }) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = FactionMembersResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Faction\"],\"summary\":\"Get a list of your faction's members\",\"description\":\"Requires public access key. <br> The 'revive_setting' value will be populated (not Unknown) if you have faction permissions (with custom, limited or full access keys), otherwise it will be set as 'Unknown'.\",\"operationId\":\"getMyFactionMembers\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiStripTagsTrue\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/FactionMembersResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getFactionMembers = struct {
    pub const operation_id = "getFactionMembers";
    pub const path = "/faction/{id}/members";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        id: FactionId,
        striptags: model.Presence(enum {
            true,
            false,
        }) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = FactionMembersResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Faction\"],\"summary\":\"Get a list of a faction's members\",\"description\":\"Requires public access key. <br> The 'revive_setting' value will be populated (not Unknown) if you're requesting data for your own faction and have faction permissions (with custom, limited or full access keys), otherwise it will be set as 'Unknown'.\",\"operationId\":\"getFactionMembers\",\"parameters\":[{\"name\":\"id\",\"in\":\"path\",\"description\":\"Faction id\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/FactionId\"}},{\"$ref\":\"#/components/parameters/ApiStripTagsTrue\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/FactionMembersResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyFactionNews = struct {
    pub const operation_id = "getMyFactionNews";
    pub const path = "/faction/news";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        striptags: model.Presence(enum {
            true,
            false,
        }) = .absent,
        limit: model.Presence(i64) = .absent,
        sort: model.Presence(enum {
            DESC,
            ASC,
        }) = .absent,
        to: model.Presence(i64) = .absent,
        from: model.Presence(i64) = .absent,
        cat: FactionNewsCategory,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = NewsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Faction\"],\"summary\":\"Get your faction's news details\",\"description\":\"Requires minimal access key with faction API access permissions. <br> It is possible to pass up to 10 categories at the time (comma separated). Categories 'attack', 'depositFunds' and 'giveFunds' are only available with 'Custom', 'Limited' or 'Full' access keys.\",\"operationId\":\"getMyFactionNews\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiStripTagsFalse\"},{\"$ref\":\"#/components/parameters/ApiLimit100\"},{\"$ref\":\"#/components/parameters/ApiSortDesc\"},{\"$ref\":\"#/components/parameters/ApiTo\"},{\"$ref\":\"#/components/parameters/ApiFrom\"},{\"name\":\"cat\",\"in\":\"query\",\"description\":\"News category type\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/FactionNewsCategory\"}},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyMinimal\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/NewsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyFactionPositions = struct {
    pub const operation_id = "getMyFactionPositions";
    pub const path = "/faction/positions";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = FactionPositionsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Faction\"],\"summary\":\"Get your faction's positions details\",\"description\":\"Requires minimal access key with faction API access permissions. <br>\",\"operationId\":\"getMyFactionPositions\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyMinimal\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/FactionPositionsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getFactionRackets = struct {
    pub const operation_id = "getFactionRackets";
    pub const path = "/faction/rackets";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = FactionRacketsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Faction\"],\"summary\":\"Get a list of current rackets\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getFactionRackets\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/FactionRacketsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getRaidReport = struct {
    pub const operation_id = "getRaidReport";
    pub const path = "/faction/{raidWarId}/raidreport";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        raidWarId: RaidWarId,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = FactionRaidWarReportResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Faction\"],\"summary\":\"Get raid war details\",\"description\":\"Requires public access key. <br> \",\"operationId\":\"getRaidReport\",\"parameters\":[{\"name\":\"raidWarId\",\"in\":\"path\",\"description\":\"Raid war id\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/RaidWarId\"}},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/FactionRaidWarReportResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyFactionRaidsHistory = struct {
    pub const operation_id = "getMyFactionRaidsHistory";
    pub const path = "/faction/raids";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        from: model.Presence(i64) = .absent,
        to: model.Presence(i64) = .absent,
        sort: model.Presence(enum {
            DESC,
            ASC,
        }) = .absent,
        limit: model.Presence(i64) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = FactionRaidsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Faction\"],\"summary\":\"Get raids history for your faction\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getMyFactionRaidsHistory\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiFrom\"},{\"$ref\":\"#/components/parameters/ApiTo\"},{\"$ref\":\"#/components/parameters/ApiSortDesc\"},{\"$ref\":\"#/components/parameters/ApiLimit100Default20\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/FactionRaidsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getFactionRaidsHistory = struct {
    pub const operation_id = "getFactionRaidsHistory";
    pub const path = "/faction/{id}/raids";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        id: FactionId,
        from: model.Presence(i64) = .absent,
        to: model.Presence(i64) = .absent,
        sort: model.Presence(enum {
            DESC,
            ASC,
        }) = .absent,
        limit: model.Presence(i64) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = FactionRaidsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Faction\"],\"summary\":\"Get a faction's raids history\",\"description\":\"Requires public access key. <br> \",\"operationId\":\"getFactionRaidsHistory\",\"parameters\":[{\"name\":\"id\",\"in\":\"path\",\"description\":\"Faction id\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/FactionId\"}},{\"$ref\":\"#/components/parameters/ApiFrom\"},{\"$ref\":\"#/components/parameters/ApiTo\"},{\"$ref\":\"#/components/parameters/ApiSortDesc\"},{\"$ref\":\"#/components/parameters/ApiLimit100Default20\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/FactionRaidsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyFactionRankedWarsHistory = struct {
    pub const operation_id = "getMyFactionRankedWarsHistory";
    pub const path = "/faction/rankedwars";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        offset: model.Presence(i64) = .absent,
        limit: model.Presence(i64) = .absent,
        from: model.Presence(i64) = .absent,
        to: model.Presence(i64) = .absent,
        sort: model.Presence(enum {
            DESC,
            ASC,
        }) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = FactionRankedWarResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Faction\"],\"summary\":\"Get ranked wars history for your faction\",\"description\":\"Requires public access key. <br> Use offset to get older results which are always ordered descending.\",\"operationId\":\"getMyFactionRankedWarsHistory\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiOffset\"},{\"$ref\":\"#/components/parameters/ApiLimit100Default20\"},{\"$ref\":\"#/components/parameters/ApiFrom\",\"description\":\"No longer has any impact on results.\"},{\"$ref\":\"#/components/parameters/ApiTo\",\"description\":\"No longer has any impact on results.\"},{\"$ref\":\"#/components/parameters/ApiSortDesc\",\"description\":\"No longer has any impact on results.\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/FactionRankedWarResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getFactionRankedWarsHistory = struct {
    pub const operation_id = "getFactionRankedWarsHistory";
    pub const path = "/faction/{id}/rankedwars";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        id: FactionId,
        offset: model.Presence(i64) = .absent,
        limit: model.Presence(i64) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = FactionRankedWarResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Faction\"],\"summary\":\"Get a faction's ranked wars history\",\"description\":\"Requires public access key. <br> Use offset to get older results which are always ordered descending.\",\"operationId\":\"getFactionRankedWarsHistory\",\"parameters\":[{\"name\":\"id\",\"in\":\"path\",\"description\":\"Faction id\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/FactionId\"}},{\"$ref\":\"#/components/parameters/ApiOffset\"},{\"$ref\":\"#/components/parameters/ApiLimit100Default20\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/FactionRankedWarResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getRankedWarReport = struct {
    pub const operation_id = "getRankedWarReport";
    pub const path = "/faction/{rankedWarId}/rankedwarreport";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        rankedWarId: RankedWarId,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = FactionRankedWarReportResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Faction\"],\"summary\":\"Get ranked war details\",\"description\":\"Requires public access key. <br> \",\"operationId\":\"getRankedWarReport\",\"parameters\":[{\"name\":\"rankedWarId\",\"in\":\"path\",\"description\":\"Ranked war id\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/RankedWarId\"}},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/FactionRankedWarReportResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyFactionReports = struct {
    pub const operation_id = "getMyFactionReports";
    pub const path = "/faction/reports";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        cat: model.Presence(ReportTypeEnum) = .absent,
        target: model.Presence(UserId) = .absent,
        limit: model.Presence(i64) = .absent,
        offset: model.Presence(i64) = .absent,
        sort: model.Presence(enum {
            DESC,
            ASC,
        }) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = ReportsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Faction\"],\"summary\":\"Get faction reports\",\"description\":\"Requires limited access key. <br>\\nThe limit is set to 25 when requesting any category other than 'stats'.<br>\\nWhen requesting the 'stats' category, limit can be increased up to 100.\",\"operationId\":\"getMyFactionReports\",\"parameters\":[{\"name\":\"cat\",\"in\":\"query\",\"description\":\"Used to filter reports with a specific type.\",\"required\":false,\"schema\":{\"$ref\":\"#/components/schemas/ReportTypeEnum\"}},{\"name\":\"target\",\"in\":\"query\",\"description\":\"Get reports for a specific player by passing their player ID.\",\"required\":false,\"schema\":{\"$ref\":\"#/components/schemas/UserId\"}},{\"$ref\":\"#/components/parameters/ApiLimit100Default20\"},{\"$ref\":\"#/components/parameters/ApiOffset\"},{\"$ref\":\"#/components/parameters/ApiSortDesc\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyLimited\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/ReportsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyFactionRevives = struct {
    pub const operation_id = "getMyFactionRevives";
    pub const path = "/faction/revives";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        filters: model.Presence([]const ApiFiltersAttacksRevivesEnum) = .absent,
        limit: model.Presence(i64) = .absent,
        sort: model.Presence(enum {
            DESC,
            ASC,
        }) = .absent,
        to: model.Presence(i64) = .absent,
        from: model.Presence(i64) = .absent,
        striptags: model.Presence(enum {
            true,
            false,
        }) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = RevivesResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Faction\"],\"summary\":\"Get your faction's detailed revives\",\"description\":\"Requires limited access key with faction API access permissions. <br>\",\"operationId\":\"getMyFactionRevives\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiFiltersIncomingOutgoing\"},{\"$ref\":\"#/components/parameters/ApiLimit100\"},{\"$ref\":\"#/components/parameters/ApiSortDesc\"},{\"$ref\":\"#/components/parameters/ApiTo\"},{\"$ref\":\"#/components/parameters/ApiFrom\"},{\"$ref\":\"#/components/parameters/ApiStripTagsTrue\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyLimited\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/RevivesResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyFactionRevivesSimplified = struct {
    pub const operation_id = "getMyFactionRevivesSimplified";
    pub const path = "/faction/revivesFull";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        filters: model.Presence([]const ApiFiltersAttacksRevivesEnum) = .absent,
        limit: model.Presence(i64) = .absent,
        sort: model.Presence(enum {
            DESC,
            ASC,
        }) = .absent,
        to: model.Presence(i64) = .absent,
        from: model.Presence(i64) = .absent,
        striptags: model.Presence(enum {
            true,
            false,
        }) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = RevivesFullResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Faction\"],\"summary\":\"Get your faction's simplified revives\",\"description\":\"Requires limited access key with faction API access permissions. <br>\",\"operationId\":\"getMyFactionRevivesSimplified\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiFiltersIncomingOutgoing\"},{\"$ref\":\"#/components/parameters/ApiLimit1000\"},{\"$ref\":\"#/components/parameters/ApiSortDesc\"},{\"$ref\":\"#/components/parameters/ApiTo\"},{\"$ref\":\"#/components/parameters/ApiFrom\"},{\"$ref\":\"#/components/parameters/ApiStripTagsTrue\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyLimited\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/RevivesFullResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getFactionSearch = struct {
    pub const operation_id = "getFactionSearch";
    pub const path = "/faction/search";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        name: model.Presence([]const u8) = .absent,
        filters: model.Presence([]const union(enum) {
            v0: enum {
                destroyed,
                notDestroyed,
                recruiting,
                notRecruiting,
            },
            v1: []const u8,
        }) = .absent,
        limit: model.Presence(i64) = .absent,
        offset: model.Presence(i64) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = FactionSearchResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Faction\"],\"summary\":\"Search factions by name or other criteria\",\"description\":\"Requires public access key. <br>This selection is standalone and cannot be used together with other selections.\",\"operationId\":\"getFactionSearch\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiName\"},{\"$ref\":\"#/components/parameters/ApiFactionSearchFilter\"},{\"$ref\":\"#/components/parameters/ApiLimit100Default20\"},{\"$ref\":\"#/components/parameters/ApiOffset\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/FactionSearchResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getFactionsSnapshot = struct {
    pub const operation_id = "getFactionsSnapshot";
    pub const path = "/faction/snapshot";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = []const u8;
    pub const media_type = "text/csv";
    pub const contract_json = "{\"tags\":[\"Faction\"],\"summary\":\"Get daily factions snapshot CSV\",\"description\":\"Requires public access key.<br>Returns a CSV daily snapshot of factions.<br>This selection is standalone and cannot be used together with other selections.<br>\\nCSV columns: id, name, tag, tag_image, banner_image, leader_id, co_leader_id, respect, days_old, rank, members, members_max, member_list, recruiting, destroyed_timestamp\",\"operationId\":\"getFactionsSnapshot\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestampSpecificPointInTime\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful CSV response\",\"content\":{\"text/csv\":{\"schema\":{\"type\":\"string\",\"example\":\"id,name,tag,tag_image,banner_image,leader_id,co_leader_id,respect,days_old,rank,members,members_max,member_list,recruiting,destroyed_timestamp\\\\n33,Honour and Pride,H&P,33-0.png,861778851-33.jpg,68358,,132939,6657,13,3,20,[68358, 123013, 295496],1\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyFactionStats = struct {
    pub const operation_id = "getMyFactionStats";
    pub const path = "/faction/stats";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = FactionStatsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Faction\"],\"summary\":\"Get your faction's challenges stats\",\"description\":\"Requires minimal access key with faction API access permissions. <br>\",\"operationId\":\"getMyFactionStats\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyMinimal\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/FactionStatsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyFactionTerritory = struct {
    pub const operation_id = "getMyFactionTerritory";
    pub const path = "/faction/territory";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = FactionTerritoriesResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Faction\"],\"summary\":\"Get a list of your faction's territories\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getMyFactionTerritory\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/FactionTerritoriesResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getFactionTerritory = struct {
    pub const operation_id = "getFactionTerritory";
    pub const path = "/faction/{id}/territory";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        id: FactionId,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = FactionTerritoriesResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Faction\"],\"summary\":\"Get a list of a faction's territories\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getFactionTerritory\",\"parameters\":[{\"name\":\"id\",\"in\":\"path\",\"description\":\"Faction id\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/FactionId\"}},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/FactionTerritoriesResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getTerritoryOwnership = struct {
    pub const operation_id = "getTerritoryOwnership";
    pub const path = "/faction/territoryownership";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        offset: model.Presence(i64) = .absent,
        limit: model.Presence(i64) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = FactionTerritoriesOwnershipResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Faction\"],\"summary\":\"Get a list territory ownership\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getTerritoryOwnership\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiOffset\"},{\"$ref\":\"#/components/parameters/ApiLimit500Default20\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/FactionTerritoriesOwnershipResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyFactionTerritoryWarsHistory = struct {
    pub const operation_id = "getMyFactionTerritoryWarsHistory";
    pub const path = "/faction/territorywars";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        from: model.Presence(i64) = .absent,
        to: model.Presence(i64) = .absent,
        sort: model.Presence(enum {
            DESC,
            ASC,
        }) = .absent,
        limit: model.Presence(i64) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = FactionTerritoryWarsHistoryResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Faction\"],\"summary\":\"Get territory wars history for your faction\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getMyFactionTerritoryWarsHistory\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiFrom\"},{\"$ref\":\"#/components/parameters/ApiTo\"},{\"$ref\":\"#/components/parameters/ApiSortDesc\"},{\"$ref\":\"#/components/parameters/ApiLimit100\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/FactionTerritoryWarsHistoryResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getFactionTerritoryWarsHistory = struct {
    pub const operation_id = "getFactionTerritoryWarsHistory";
    pub const path = "/faction/{id}/territorywars";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        id: FactionId,
        from: model.Presence(i64) = .absent,
        to: model.Presence(i64) = .absent,
        sort: model.Presence(enum {
            DESC,
            ASC,
        }) = .absent,
        limit: model.Presence(i64) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = FactionTerritoryWarsHistoryResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Faction\"],\"summary\":\"Get a faction's territory wars history\",\"description\":\"Requires public access key. <br> \",\"operationId\":\"getFactionTerritoryWarsHistory\",\"parameters\":[{\"name\":\"id\",\"in\":\"path\",\"description\":\"Faction id\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/FactionId\"}},{\"$ref\":\"#/components/parameters/ApiFrom\"},{\"$ref\":\"#/components/parameters/ApiTo\"},{\"$ref\":\"#/components/parameters/ApiSortDesc\"},{\"$ref\":\"#/components/parameters/ApiLimit100\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/FactionTerritoryWarsHistoryResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getTerritoryWarReport = struct {
    pub const operation_id = "getTerritoryWarReport";
    pub const path = "/faction/{territoryWarId}/territorywarreport";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        territoryWarId: TerritoryWarId,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = FactionTerritoryWarReportResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Faction\"],\"summary\":\"Get territory war details\",\"description\":\"Requires public access key. <br> \",\"operationId\":\"getTerritoryWarReport\",\"parameters\":[{\"name\":\"territoryWarId\",\"in\":\"path\",\"description\":\"Territory war id\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/TerritoryWarId\"}},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/FactionTerritoryWarReportResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyFactionUpgrades = struct {
    pub const operation_id = "getMyFactionUpgrades";
    pub const path = "/faction/upgrades";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = FactionUpgradesResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Faction\"],\"summary\":\"Get your faction's upgrades\",\"description\":\"Requires minimal access key with faction API access permissions. <br>\",\"operationId\":\"getMyFactionUpgrades\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyMinimal\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/FactionUpgradesResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getWarfareChains = struct {
    pub const operation_id = "getWarfareChains";
    pub const path = "/faction/warfarechains";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        cat: enum {
            active,
            complete,
        },
        limit: model.Presence(i64) = .absent,
        sort: model.Presence(enum {
            DESC,
            ASC,
        }) = .absent,
        from: model.Presence(i64) = .absent,
        to: model.Presence(i64) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = FactionWarfareChainsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Faction\"],\"summary\":\"Get all chains\",\"description\":\"Requires public access key. <br>By default, active chains are returned.\",\"operationId\":\"getWarfareChains\",\"parameters\":[{\"name\":\"cat\",\"in\":\"query\",\"required\":true,\"schema\":{\"type\":\"string\",\"enum\":[\"active\",\"complete\"]}},{\"$ref\":\"#/components/parameters/ApiLimit100\"},{\"$ref\":\"#/components/parameters/ApiSort\"},{\"$ref\":\"#/components/parameters/ApiFrom\"},{\"$ref\":\"#/components/parameters/ApiTo\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/FactionWarfareChainsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getWarfareRaids = struct {
    pub const operation_id = "getWarfareRaids";
    pub const path = "/faction/warfareraids";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        limit: model.Presence(i64) = .absent,
        sort: model.Presence(enum {
            DESC,
            ASC,
        }) = .absent,
        from: model.Presence(i64) = .absent,
        to: model.Presence(i64) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = FactionWarfareRaidsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Faction\"],\"summary\":\"Get all raids\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getWarfareRaids\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiLimit100\"},{\"$ref\":\"#/components/parameters/ApiSort\"},{\"$ref\":\"#/components/parameters/ApiFrom\"},{\"$ref\":\"#/components/parameters/ApiTo\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/FactionWarfareRaidsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getWarfareRankedWars = struct {
    pub const operation_id = "getWarfareRankedWars";
    pub const path = "/faction/warfareranked";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        limit: model.Presence(i64) = .absent,
        sort: model.Presence(enum {
            DESC,
            ASC,
        }) = .absent,
        from: model.Presence(i64) = .absent,
        to: model.Presence(i64) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = FactionWarfareRankedResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Faction\"],\"summary\":\"Get all ranked wars\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getWarfareRankedWars\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiLimit100\"},{\"$ref\":\"#/components/parameters/ApiSort\"},{\"$ref\":\"#/components/parameters/ApiFrom\"},{\"$ref\":\"#/components/parameters/ApiTo\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/FactionWarfareRankedResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getWarfareTerritoryWars = struct {
    pub const operation_id = "getWarfareTerritoryWars";
    pub const path = "/faction/warfareterritory";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        limit: model.Presence(i64) = .absent,
        sort: model.Presence(enum {
            DESC,
            ASC,
        }) = .absent,
        from: model.Presence(i64) = .absent,
        to: model.Presence(i64) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = FactionWarfareTerritoryWarsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Faction\"],\"summary\":\"Get all territory wars\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getWarfareTerritoryWars\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiLimit100\"},{\"$ref\":\"#/components/parameters/ApiSort\"},{\"$ref\":\"#/components/parameters/ApiFrom\"},{\"$ref\":\"#/components/parameters/ApiTo\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/FactionWarfareTerritoryWarsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getWarfare = struct {
    pub const operation_id = "getWarfare";
    pub const path = "/faction/warfare";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        cat: FactionWarfareTypeEnum,
        limit: model.Presence(i64) = .absent,
        sort: model.Presence(enum {
            DESC,
            ASC,
        }) = .absent,
        from: model.Presence(i64) = .absent,
        to: model.Presence(i64) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = FactionWarfareResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Faction\"],\"summary\":\"Get faction warfare\",\"description\":\"This selection is replaced by other warfare selections and 'faction' -> 'dirtybombs'.<br>This will be removed on 1st January 2027<b></b>.<br>Requires public access key. <br>The response depends on the selected category.\",\"operationId\":\"getWarfare\",\"parameters\":[{\"name\":\"cat\",\"in\":\"query\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/FactionWarfareTypeEnum\"}},{\"$ref\":\"#/components/parameters/ApiLimit100\"},{\"$ref\":\"#/components/parameters/ApiSort\"},{\"$ref\":\"#/components/parameters/ApiFrom\"},{\"$ref\":\"#/components/parameters/ApiTo\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/FactionWarfareResponse\"}}}}},\"deprecated\":true,\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyFactionWars = struct {
    pub const operation_id = "getMyFactionWars";
    pub const path = "/faction/wars";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = FactionWarsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Faction\"],\"summary\":\"Get your faction's wars & pacts details\",\"description\":\"Requires public access key. <br> \",\"operationId\":\"getMyFactionWars\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/FactionWarsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getFactionWars = struct {
    pub const operation_id = "getFactionWars";
    pub const path = "/faction/{id}/wars";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        id: FactionId,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = FactionWarsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Faction\"],\"summary\":\"Get a faction's wars & pacts details\",\"description\":\"Requires public access key. <br> \",\"operationId\":\"getFactionWars\",\"parameters\":[{\"name\":\"id\",\"in\":\"path\",\"description\":\"Faction id\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/FactionId\"}},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/FactionWarsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getFactionLookup = struct {
    pub const operation_id = "getFactionLookup";
    pub const path = "/faction/lookup";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = FactionLookupResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Faction\"],\"description\":\"Requires public access key. <br>\",\"operationId\":\"getFactionLookup\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/FactionLookupResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getFactionTimestamp = struct {
    pub const operation_id = "getFactionTimestamp";
    pub const path = "/faction/timestamp";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = TimestampResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Faction\"],\"summary\":\"Get current server time\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getFactionTimestamp\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/TimestampResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getFactionGeneric = struct {
    pub const operation_id = "getFactionGeneric";
    pub const path = "/faction";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        selections: model.Presence([]const FactionSelectionName) = .absent,
        id: model.Presence(union(enum) {
            v0: FactionId,
            v1: FactionCrimeId,
            v2: ChainId,
            v3: RankedWarId,
            v4: TerritoryWarId,
            v5: RaidWarId,
        }) = .absent,
        legacy: model.Presence([]const FactionSelectionName) = .absent,
        limit: model.Presence(i64) = .absent,
        from: model.Presence(i64) = .absent,
        to: model.Presence(i64) = .absent,
        cat: model.Presence(union(enum) {
            v0: enum {
                all,
                current,
            },
            v1: enum {
                all,
                recruiting,
                planning,
                failure,
                successful,
                expired,
                available,
                completed,
            },
            v2: FactionNewsCategory,
            v3: FactionRankedWarsCategoryEnum,
            v4: FactionArmoryCategoryEnum,
            v5: ReportTypeEnum,
            v6: FactionWarfareTypeEnum,
            v7: FactionTerritoryWarsCategoryEnum,
        }) = .absent,
        stat: model.Presence(FactionStatEnum) = .absent,
        filters: model.Presence(enum {
            created_at,
            executed_at,
            ready_at,
            expired_at,
            incoming,
            outgoing,
        }) = .absent,
        striptags: model.Presence(enum {
            true,
            false,
        }) = .absent,
        sort: model.Presence(enum {
            DESC,
            ASC,
        }) = .absent,
        offset: model.Presence(i64) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = struct {
        hof: model.Presence(FactionHofStats) = .absent,
        members: model.Presence([]const FactionMember) = .absent,
        basic: model.Presence(FactionBasic) = .absent,
        pacts: model.Presence([]const FactionPact) = .absent,
        wars: model.Presence(FactionWars) = .absent,
        news: model.Presence([]const News) = .absent,
        _metadata: model.Presence(union(enum) {
            v0: RequestMetadataWithLinks,
            v1: RequestMetadataWithLinksAndTotal,
        }) = .absent,
        revives: model.Presence(union(enum) {
            v0: []const Revive,
            v1: []const ReviveSimplified,
        }) = .absent,
        territorywars: model.Presence([]const FactionTerritoryWarFinished) = .absent,
        attacks: model.Presence(union(enum) {
            v0: []const Attack,
            v1: []const AttackSimplified,
        }) = .absent,
        balance: model.Presence(FactionBalance) = .absent,
        raidreport: model.Presence(FactionRaidReport) = .absent,
        territoryOwnership: model.Presence([]const FactionTerritoryOwnership) = .absent,
        positions: model.Presence([]const FactionPosition) = .absent,
        applications: model.Presence([]const FactionApplication) = .absent,
        chain: model.Presence(FactionOngoingChain) = .absent,
        chains: model.Presence([]const FactionChain) = .absent,
        chainreport: model.Presence(FactionChainReport) = .absent,
        crimes: model.Presence([]const FactionCrime) = .absent,
        crime: model.Presence(FactionCrime) = .absent,
        raids: model.Presence([]const FactionRaidWarfare) = .absent,
        warfare: model.Presence(union(enum) {
            v0: []const FactionRankedWarDetails,
            v1: []const FactionTerritoryWarfare,
            v2: []const FactionChainWarfare,
            v3: []const FactionRaidWarfare,
            v4: []const FactionWarfareDirtyBomb,
        }) = .absent,
        rankedwarreport: model.Presence(struct {
            id: RankedWarId,
            start: i64,
            end: i64,
            winner: FactionId,
            forfeit: bool,
            factions: []const struct {
                id: FactionId,
                name: []const u8,
                score: i64,
                attacks: i64,
                rank: struct {
                    before: []const u8,
                    after: []const u8,
                    pub const json_schema = "{\"required\":[\"before\",\"after\"],\"properties\":{\"before\":{\"type\":\"string\"},\"after\":{\"type\":\"string\"}},\"type\":\"object\"}";
                },
                rewards: struct {
                    respect: i64,
                    points: i64,
                    items: []const struct {
                        id: ItemId,
                        name: []const u8,
                        quantity: i64,
                        pub const json_schema = "{\"required\":[\"id\",\"name\",\"quantity\"],\"properties\":{\"id\":{\"$ref\":\"#/components/schemas/ItemId\"},\"name\":{\"type\":\"string\"},\"quantity\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
                    },
                    pub const json_schema = "{\"required\":[\"respect\",\"points\",\"items\"],\"properties\":{\"respect\":{\"type\":\"integer\",\"format\":\"int32\"},\"points\":{\"type\":\"integer\",\"format\":\"int32\"},\"items\":{\"type\":\"array\",\"items\":{\"required\":[\"id\",\"name\",\"quantity\"],\"properties\":{\"id\":{\"$ref\":\"#/components/schemas/ItemId\"},\"name\":{\"type\":\"string\"},\"quantity\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}}},\"type\":\"object\"}";
                },
                members: []const struct {
                    id: UserId,
                    name: []const u8,
                    level: i64,
                    attacks: i64,
                    score: f64,
                    pub const json_schema = "{\"required\":[\"id\",\"name\",\"level\",\"attacks\",\"score\"],\"properties\":{\"id\":{\"$ref\":\"#/components/schemas/UserId\"},\"name\":{\"type\":\"string\"},\"level\":{\"type\":\"integer\",\"format\":\"int32\"},\"attacks\":{\"type\":\"integer\",\"format\":\"int32\"},\"score\":{\"type\":\"number\",\"format\":\"float\"}},\"type\":\"object\"}";
                },
                pub const json_schema = "{\"required\":[\"id\",\"name\",\"score\",\"attacks\",\"rank\",\"rewards\",\"members\"],\"properties\":{\"id\":{\"$ref\":\"#/components/schemas/FactionId\"},\"name\":{\"type\":\"string\"},\"score\":{\"type\":\"integer\",\"format\":\"int32\"},\"attacks\":{\"type\":\"integer\",\"format\":\"int32\"},\"rank\":{\"required\":[\"before\",\"after\"],\"properties\":{\"before\":{\"type\":\"string\"},\"after\":{\"type\":\"string\"}},\"type\":\"object\"},\"rewards\":{\"required\":[\"respect\",\"points\",\"items\"],\"properties\":{\"respect\":{\"type\":\"integer\",\"format\":\"int32\"},\"points\":{\"type\":\"integer\",\"format\":\"int32\"},\"items\":{\"type\":\"array\",\"items\":{\"required\":[\"id\",\"name\",\"quantity\"],\"properties\":{\"id\":{\"$ref\":\"#/components/schemas/ItemId\"},\"name\":{\"type\":\"string\"},\"quantity\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}}},\"type\":\"object\"},\"members\":{\"type\":\"array\",\"items\":{\"required\":[\"id\",\"name\",\"level\",\"attacks\",\"score\"],\"properties\":{\"id\":{\"$ref\":\"#/components/schemas/UserId\"},\"name\":{\"type\":\"string\"},\"level\":{\"type\":\"integer\",\"format\":\"int32\"},\"attacks\":{\"type\":\"integer\",\"format\":\"int32\"},\"score\":{\"type\":\"number\",\"format\":\"float\"}},\"type\":\"object\"}}},\"type\":\"object\"}";
            },
            pub const json_schema = "{\"required\":[\"id\",\"start\",\"end\",\"winner\",\"forfeit\",\"factions\"],\"properties\":{\"id\":{\"$ref\":\"#/components/schemas/RankedWarId\"},\"start\":{\"description\":\"Timestamp the war started at.\",\"type\":\"integer\",\"format\":\"int32\"},\"end\":{\"description\":\"Timestamp the war ended at.\",\"type\":\"integer\",\"format\":\"int32\"},\"winner\":{\"$ref\":\"#/components/schemas/FactionId\"},\"forfeit\":{\"type\":\"boolean\"},\"factions\":{\"type\":\"array\",\"items\":{\"required\":[\"id\",\"name\",\"score\",\"attacks\",\"rank\",\"rewards\",\"members\"],\"properties\":{\"id\":{\"$ref\":\"#/components/schemas/FactionId\"},\"name\":{\"type\":\"string\"},\"score\":{\"type\":\"integer\",\"format\":\"int32\"},\"attacks\":{\"type\":\"integer\",\"format\":\"int32\"},\"rank\":{\"required\":[\"before\",\"after\"],\"properties\":{\"before\":{\"type\":\"string\"},\"after\":{\"type\":\"string\"}},\"type\":\"object\"},\"rewards\":{\"required\":[\"respect\",\"points\",\"items\"],\"properties\":{\"respect\":{\"type\":\"integer\",\"format\":\"int32\"},\"points\":{\"type\":\"integer\",\"format\":\"int32\"},\"items\":{\"type\":\"array\",\"items\":{\"required\":[\"id\",\"name\",\"quantity\"],\"properties\":{\"id\":{\"$ref\":\"#/components/schemas/ItemId\"},\"name\":{\"type\":\"string\"},\"quantity\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}}},\"type\":\"object\"},\"members\":{\"type\":\"array\",\"items\":{\"required\":[\"id\",\"name\",\"level\",\"attacks\",\"score\"],\"properties\":{\"id\":{\"$ref\":\"#/components/schemas/UserId\"},\"name\":{\"type\":\"string\"},\"level\":{\"type\":\"integer\",\"format\":\"int32\"},\"attacks\":{\"type\":\"integer\",\"format\":\"int32\"},\"score\":{\"type\":\"number\",\"format\":\"float\"}},\"type\":\"object\"}}},\"type\":\"object\"}}},\"type\":\"object\"}";
        }) = .absent,
        territorywarreport: model.Presence(FactionTerritoryWarReport) = .absent,
        territory: model.Presence([]const FactionTerritory) = .absent,
        upgrades: model.Presence(FactionUpgrades) = .absent,
        state: model.Presence(FactionBranchStateEnum) = .absent,
        stats: model.Presence([]const FactionStat) = .absent,
        contributors: model.Presence([]const FactionContributor) = .absent,
        inventory_timestamp: model.Presence(i64) = .absent,
        inventory: model.Presence([]const FactionInventoryItem) = .absent,
        crimeexp: model.Presence([]const UserId) = .absent,
        rackets: model.Presence([]const TornRacket) = .absent,
        rankedwars: model.Presence([]const FactionRankedWarDetails) = .absent,
        selections: model.Presence([]const FactionSelectionName) = .absent,
        dirtybombs: model.Presence([]const FactionWarfareDirtyBomb) = .absent,
        warfarechains: model.Presence([]const FactionChainWarfare) = .absent,
        warfareterritory: model.Presence([]const FactionTerritoryWarfare) = .absent,
        warfareraids: model.Presence([]const FactionRaidWarfare) = .absent,
        warfareranked: model.Presence([]const FactionRankedWarDetails) = .absent,
        timestamp: model.Presence(i64) = .absent,
        pub const json_schema = "{\"type\":\"object\",\"properties\":{\"hof\":{\"$ref\":\"#/components/schemas/FactionHofStats\"},\"members\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/FactionMember\"}},\"basic\":{\"$ref\":\"#/components/schemas/FactionBasic\"},\"pacts\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/FactionPact\"}},\"wars\":{\"$ref\":\"#/components/schemas/FactionWars\"},\"news\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/News\"}},\"_metadata\":{\"anyOf\":[{\"$ref\":\"#/components/schemas/RequestMetadataWithLinks\"},{\"$ref\":\"#/components/schemas/RequestMetadataWithLinksAndTotal\"}]},\"revives\":{\"anyOf\":[{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/Revive\"}},{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/ReviveSimplified\"}}]},\"territorywars\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/FactionTerritoryWarFinished\"}},\"attacks\":{\"anyOf\":[{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/Attack\"}},{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/AttackSimplified\"}}]},\"balance\":{\"$ref\":\"#/components/schemas/FactionBalance\"},\"raidreport\":{\"$ref\":\"#/components/schemas/FactionRaidReport\"},\"territoryOwnership\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/FactionTerritoryOwnership\"}},\"positions\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/FactionPosition\"}},\"applications\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/FactionApplication\"}},\"chain\":{\"$ref\":\"#/components/schemas/FactionOngoingChain\"},\"chains\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/FactionChain\"}},\"chainreport\":{\"$ref\":\"#/components/schemas/FactionChainReport\"},\"crimes\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/FactionCrime\"}},\"crime\":{\"$ref\":\"#/components/schemas/FactionCrime\"},\"raids\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/FactionRaidWarfare\"}},\"warfare\":{\"oneOf\":[{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/FactionRankedWarDetails\"}},{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/FactionTerritoryWarfare\"}},{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/FactionChainWarfare\"}},{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/FactionRaidWarfare\"}},{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/FactionWarfareDirtyBomb\"}}]},\"rankedwarreport\":{\"required\":[\"id\",\"start\",\"end\",\"winner\",\"forfeit\",\"factions\"],\"properties\":{\"id\":{\"$ref\":\"#/components/schemas/RankedWarId\"},\"start\":{\"description\":\"Timestamp the war started at.\",\"type\":\"integer\",\"format\":\"int32\"},\"end\":{\"description\":\"Timestamp the war ended at.\",\"type\":\"integer\",\"format\":\"int32\"},\"winner\":{\"$ref\":\"#/components/schemas/FactionId\"},\"forfeit\":{\"type\":\"boolean\"},\"factions\":{\"type\":\"array\",\"items\":{\"required\":[\"id\",\"name\",\"score\",\"attacks\",\"rank\",\"rewards\",\"members\"],\"properties\":{\"id\":{\"$ref\":\"#/components/schemas/FactionId\"},\"name\":{\"type\":\"string\"},\"score\":{\"type\":\"integer\",\"format\":\"int32\"},\"attacks\":{\"type\":\"integer\",\"format\":\"int32\"},\"rank\":{\"required\":[\"before\",\"after\"],\"properties\":{\"before\":{\"type\":\"string\"},\"after\":{\"type\":\"string\"}},\"type\":\"object\"},\"rewards\":{\"required\":[\"respect\",\"points\",\"items\"],\"properties\":{\"respect\":{\"type\":\"integer\",\"format\":\"int32\"},\"points\":{\"type\":\"integer\",\"format\":\"int32\"},\"items\":{\"type\":\"array\",\"items\":{\"required\":[\"id\",\"name\",\"quantity\"],\"properties\":{\"id\":{\"$ref\":\"#/components/schemas/ItemId\"},\"name\":{\"type\":\"string\"},\"quantity\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}}},\"type\":\"object\"},\"members\":{\"type\":\"array\",\"items\":{\"required\":[\"id\",\"name\",\"level\",\"attacks\",\"score\"],\"properties\":{\"id\":{\"$ref\":\"#/components/schemas/UserId\"},\"name\":{\"type\":\"string\"},\"level\":{\"type\":\"integer\",\"format\":\"int32\"},\"attacks\":{\"type\":\"integer\",\"format\":\"int32\"},\"score\":{\"type\":\"number\",\"format\":\"float\"}},\"type\":\"object\"}}},\"type\":\"object\"}}},\"type\":\"object\"},\"territorywarreport\":{\"$ref\":\"#/components/schemas/FactionTerritoryWarReport\"},\"territory\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/FactionTerritory\"}},\"upgrades\":{\"$ref\":\"#/components/schemas/FactionUpgrades\"},\"state\":{\"$ref\":\"#/components/schemas/FactionBranchStateEnum\"},\"stats\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/FactionStat\"}},\"contributors\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/FactionContributor\"}},\"inventory_timestamp\":{\"type\":\"integer\",\"format\":\"int64\"},\"inventory\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/FactionInventoryItem\"}},\"crimeexp\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/UserId\"}},\"rackets\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/TornRacket\"}},\"rankedwars\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/FactionRankedWarDetails\"}},\"selections\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/FactionSelectionName\"}},\"dirtybombs\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/FactionWarfareDirtyBomb\"}},\"warfarechains\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/FactionChainWarfare\"}},\"warfareterritory\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/FactionTerritoryWarfare\"}},\"warfareraids\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/FactionRaidWarfare\"}},\"warfareranked\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/FactionRankedWarDetails\"}},\"timestamp\":{\"type\":\"integer\",\"format\":\"int32\"}}}";
    };
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Faction\"],\"summary\":\"Get any Faction selection\",\"description\":\"Key access level depends on the required selections. <br> Choose one or more selections (comma separated).\",\"operationId\":\"getFactionGeneric\",\"parameters\":[{\"name\":\"selections\",\"in\":\"query\",\"description\":\"Selection names\",\"required\":false,\"style\":\"form\",\"explode\":false,\"schema\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/FactionSelectionName\"}}},{\"name\":\"id\",\"in\":\"query\",\"description\":\"selection id\",\"required\":false,\"schema\":{\"oneOf\":[{\"$ref\":\"#/components/schemas/FactionId\"},{\"$ref\":\"#/components/schemas/FactionCrimeId\"},{\"$ref\":\"#/components/schemas/ChainId\"},{\"$ref\":\"#/components/schemas/RankedWarId\"},{\"$ref\":\"#/components/schemas/TerritoryWarId\"},{\"$ref\":\"#/components/schemas/RaidWarId\"}]}},{\"name\":\"legacy\",\"in\":\"query\",\"description\":\"Legacy selection names for which you want or expect API v1 response\",\"required\":false,\"style\":\"form\",\"explode\":false,\"schema\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/FactionSelectionName\"}}},{\"$ref\":\"#/components/parameters/ApiLimit\"},{\"$ref\":\"#/components/parameters/ApiFrom\"},{\"$ref\":\"#/components/parameters/ApiTo\"},{\"name\":\"cat\",\"in\":\"query\",\"description\":\"Selection category\",\"required\":false,\"schema\":{\"oneOf\":[{\"type\":\"string\",\"enum\":[\"all\",\"current\"]},{\"type\":\"string\",\"enum\":[\"all\",\"recruiting\",\"planning\",\"failure\",\"successful\",\"expired\",\"available\",\"completed\"]},{\"$ref\":\"#/components/schemas/FactionNewsCategory\"},{\"$ref\":\"#/components/schemas/FactionRankedWarsCategoryEnum\"},{\"$ref\":\"#/components/schemas/FactionArmoryCategoryEnum\"},{\"$ref\":\"#/components/schemas/ReportTypeEnum\"},{\"$ref\":\"#/components/schemas/FactionWarfareTypeEnum\"},{\"$ref\":\"#/components/schemas/FactionTerritoryWarsCategoryEnum\"}]}},{\"name\":\"stat\",\"in\":\"query\",\"description\":\"Stat category\",\"required\":false,\"schema\":{\"$ref\":\"#/components/schemas/FactionStatEnum\"}},{\"name\":\"filters\",\"in\":\"query\",\"required\":false,\"schema\":{\"type\":\"string\",\"enum\":[\"created_at\",\"executed_at\",\"ready_at\",\"expired_at\",\"incoming\",\"outgoing\"]}},{\"$ref\":\"#/components/parameters/ApiStripTags\"},{\"$ref\":\"#/components/parameters/ApiSort\"},{\"$ref\":\"#/components/parameters/ApiOffsetNoDefault\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"anyOf\":[{\"$ref\":\"#/components/schemas/FactionHofResponse\"},{\"$ref\":\"#/components/schemas/FactionMembersResponse\"},{\"$ref\":\"#/components/schemas/FactionBasicResponse\"},{\"$ref\":\"#/components/schemas/FactionWarsResponse\"},{\"$ref\":\"#/components/schemas/NewsResponse\"},{\"$ref\":\"#/components/schemas/RevivesResponse\"},{\"$ref\":\"#/components/schemas/FactionTerritoryWarsHistoryResponse\"},{\"$ref\":\"#/components/schemas/AttacksResponse\"},{\"$ref\":\"#/components/schemas/FactionBalanceResponse\"},{\"$ref\":\"#/components/schemas/FactionRaidWarReportResponse\"},{\"$ref\":\"#/components/schemas/FactionTerritoriesOwnershipResponse\"},{\"$ref\":\"#/components/schemas/FactionPositionsResponse\"},{\"$ref\":\"#/components/schemas/RevivesFullResponse\"},{\"$ref\":\"#/components/schemas/AttacksFullResponse\"},{\"$ref\":\"#/components/schemas/FactionApplicationsResponse\"},{\"$ref\":\"#/components/schemas/FactionOngoingChainResponse\"},{\"$ref\":\"#/components/schemas/FactionChainsResponse\"},{\"$ref\":\"#/components/schemas/FactionChainReportResponse\"},{\"$ref\":\"#/components/schemas/FactionCrimesResponse\"},{\"$ref\":\"#/components/schemas/FactionCrimeResponse\"},{\"$ref\":\"#/components/schemas/FactionRaidsResponse\"},{\"$ref\":\"#/components/schemas/FactionWarfareResponse\"},{\"$ref\":\"#/components/schemas/FactionRankedWarReportResponse\"},{\"$ref\":\"#/components/schemas/FactionTerritoryWarReportResponse\"},{\"$ref\":\"#/components/schemas/FactionTerritoriesResponse\"},{\"$ref\":\"#/components/schemas/FactionUpgradesResponse\"},{\"$ref\":\"#/components/schemas/FactionStatsResponse\"},{\"$ref\":\"#/components/schemas/FactionContributorsResponse\"},{\"$ref\":\"#/components/schemas/FactionInventoryResponse\"},{\"$ref\":\"#/components/schemas/FactionCrimeExpResponse\"},{\"$ref\":\"#/components/schemas/FactionRacketsResponse\"},{\"$ref\":\"#/components/schemas/FactionRankedWarResponse\"},{\"$ref\":\"#/components/schemas/FactionLookupResponse\"},{\"$ref\":\"#/components/schemas/FactionWarfareDirtyBombsResponse\"},{\"$ref\":\"#/components/schemas/FactionWarfareChainsResponse\"},{\"$ref\":\"#/components/schemas/FactionWarfareTerritoryWarsResponse\"},{\"$ref\":\"#/components/schemas/FactionWarfareRaidsResponse\"},{\"$ref\":\"#/components/schemas/FactionWarfareRankedResponse\"},{\"$ref\":\"#/components/schemas/TimestampResponse\"}]}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyCompanyApplications = struct {
    pub const operation_id = "getMyCompanyApplications";
    pub const path = "/company/applications";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = CompanyApplicationsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Company\"],\"summary\":\"Get your company's applications\",\"description\":\"Requires limited access key. <br>\",\"operationId\":\"getMyCompanyApplications\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyLimited\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/CompanyApplicationsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyCompanyEmployees = struct {
    pub const operation_id = "getMyCompanyEmployees";
    pub const path = "/company/employees";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        striptags: model.Presence(enum {
            true,
            false,
        }) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = CompanyEmployeesResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Company\"],\"summary\":\"Get my company's employees\",\"description\":\"Requires public access key. <br>When using Limited, Custom or Full access API keys, the response will be:<br>\\n * for director: CompanyEmployeeFull\\n * for employee: CompanyEmployeeExtended\\n * anyone else: CompanyEmployee.\",\"operationId\":\"getMyCompanyEmployees\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiStripTagsTrue\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/CompanyEmployeesResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getCompanyEmployees = struct {
    pub const operation_id = "getCompanyEmployees";
    pub const path = "/company/{id}/employees";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        id: CompanyId,
        striptags: model.Presence(enum {
            true,
            false,
        }) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = CompanyEmployeesResponseBasic;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Company\"],\"summary\":\"Get a company's employees\",\"description\":\"Requires public access key.\",\"operationId\":\"getCompanyEmployees\",\"parameters\":[{\"name\":\"id\",\"in\":\"path\",\"description\":\"Company id\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/CompanyId\"}},{\"$ref\":\"#/components/parameters/ApiStripTagsTrue\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/CompanyEmployeesResponseBasic\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyCompanyNews = struct {
    pub const operation_id = "getMyCompanyNews";
    pub const path = "/company/news";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        striptags: model.Presence(enum {
            true,
            false,
        }) = .absent,
        limit: model.Presence(i64) = .absent,
        sort: model.Presence(enum {
            DESC,
            ASC,
        }) = .absent,
        to: model.Presence(i64) = .absent,
        from: model.Presence(i64) = .absent,
        cat: CompanyNewsCategory,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = NewsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Company\"],\"summary\":\"Get your company's news details\",\"description\":\"Requires limited access key. <br>\",\"operationId\":\"getMyCompanyNews\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiStripTagsFalse\"},{\"$ref\":\"#/components/parameters/ApiLimit100\"},{\"$ref\":\"#/components/parameters/ApiSortDesc\"},{\"$ref\":\"#/components/parameters/ApiTo\"},{\"$ref\":\"#/components/parameters/ApiFrom\"},{\"name\":\"cat\",\"in\":\"query\",\"description\":\"News category type\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/CompanyNewsCategory\"}},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyLimited\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/NewsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getCompaniesList = struct {
    pub const operation_id = "getCompaniesList";
    pub const path = "/company/{typeId}/companies";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        typeId: CompanyTypeId,
        limit: model.Presence(i64) = .absent,
        offset: model.Presence(i64) = .absent,
        striptags: model.Presence(enum {
            true,
            false,
        }) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = CompaniesResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Company\"],\"summary\":\"Get a list of companies for a specific company type\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getCompaniesList\",\"parameters\":[{\"name\":\"typeId\",\"in\":\"path\",\"description\":\"Company type id\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/CompanyTypeId\"}},{\"$ref\":\"#/components/parameters/ApiLimit100Default20\"},{\"$ref\":\"#/components/parameters/ApiOffsetNoDefault\"},{\"$ref\":\"#/components/parameters/ApiStripTagsTrue\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/CompaniesResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyCompanyProfile = struct {
    pub const operation_id = "getMyCompanyProfile";
    pub const path = "/company/profile";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        striptags: model.Presence(enum {
            true,
            false,
        }) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = CompanyProfileResponseMixed;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Company\"],\"summary\":\"Get my company's profile\",\"description\":\"Requires public access key. <br>When using Limited, Custom or Full access API keys, the response will be of type CompanyProfileExtended, otherwise it will be CompanyProfile.\",\"operationId\":\"getMyCompanyProfile\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiStripTagsTrue\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/CompanyProfileResponseMixed\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getCompanyProfile = struct {
    pub const operation_id = "getCompanyProfile";
    pub const path = "/company/{id}/profile";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        id: CompanyId,
        striptags: model.Presence(enum {
            true,
            false,
        }) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = CompanyProfileResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Company\"],\"summary\":\"Get a company's profile\",\"description\":\"Requires public access key.\",\"operationId\":\"getCompanyProfile\",\"parameters\":[{\"name\":\"id\",\"in\":\"path\",\"description\":\"Company id\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/CompanyId\"}},{\"$ref\":\"#/components/parameters/ApiStripTagsTrue\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/CompanyProfileResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getCompaniesSearch = struct {
    pub const operation_id = "getCompaniesSearch";
    pub const path = "/company/search";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        name: model.Presence([]const u8) = .absent,
        filters: model.Presence([]const union(enum) {
            v0: enum {
                recruiting,
                notRecruiting,
            },
            v1: []const u8,
        }) = .absent,
        limit: model.Presence(i64) = .absent,
        offset: model.Presence(i64) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = CompaniesSearchResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Company\"],\"summary\":\"Search companies by name or other criteria\",\"description\":\"Requires public access key. <br>This selection is standalone and cannot be used together with other selections.\",\"operationId\":\"getCompaniesSearch\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiName\"},{\"$ref\":\"#/components/parameters/ApiCompanySearchFilter\"},{\"$ref\":\"#/components/parameters/ApiLimit100Default20\"},{\"$ref\":\"#/components/parameters/ApiOffset\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/CompaniesSearchResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getCompaniesSnapshot = struct {
    pub const operation_id = "getCompaniesSnapshot";
    pub const path = "/company/snapshot";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = []const u8;
    pub const media_type = "text/csv";
    pub const contract_json = "{\"tags\":[\"Company\"],\"summary\":\"Get daily companies snapshot CSV\",\"description\":\"Requires public access key.<br>Returns a CSV daily snapshot of companies.<br>This selection is standalone and cannot be used together with other selections.<br>\\nCSV columns: id, name, created_at, days_old, image, type, rating, director_id,\\nemployees_hired, employees_capacity, daily_income, daily_customers,\\nweekly_income, weekly_customers, applications_allowed\",\"operationId\":\"getCompaniesSnapshot\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestampSpecificPointInTime\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful CSV response\",\"content\":{\"text/csv\":{\"schema\":{\"type\":\"string\",\"example\":\"id,name,created_at,days_old,image,type,rating,director_id,employees_hired,employees_capacity,daily_income,daily_customers,weekly_income,weekly_customers,applications_allowed\\\\n125981,Safety first,1779957421,0,,10,0,4082850,1,7,0,0,0,0,1\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMyCompanyStock = struct {
    pub const operation_id = "getMyCompanyStock";
    pub const path = "/company/stock";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = CompanyStockResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Company\"],\"summary\":\"Get your company's stock\",\"description\":\"Requires limited access key. <br>\",\"operationId\":\"getMyCompanyStock\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyLimited\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/CompanyStockResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getCompanyLookup = struct {
    pub const operation_id = "getCompanyLookup";
    pub const path = "/company/lookup";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = CompanyLookupResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Company\"],\"description\":\"Requires public access key. <br>\",\"operationId\":\"getCompanyLookup\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/CompanyLookupResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getCompanyTimestamp = struct {
    pub const operation_id = "getCompanyTimestamp";
    pub const path = "/company/timestamp";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = TimestampResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Company\"],\"summary\":\"Get current server time\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getCompanyTimestamp\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/TimestampResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getCompanyGeneric = struct {
    pub const operation_id = "getCompanyGeneric";
    pub const path = "/company";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        selections: model.Presence([]const CompanySelectionName) = .absent,
        id: model.Presence(union(enum) {
            v0: CompanyId,
        }) = .absent,
        legacy: model.Presence([]const CompanySelectionName) = .absent,
        cat: model.Presence(union(enum) {
            v0: CompanyNewsCategory,
        }) = .absent,
        limit: model.Presence(i64) = .absent,
        striptags: model.Presence(enum {
            true,
            false,
        }) = .absent,
        offset: model.Presence(i64) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = struct {
        applications: model.Presence([]const CompanyApplication) = .absent,
        employees: model.Presence(union(enum) {
            v0: []const union(enum) {
                v0: CompanyEmployee,
                v1: CompanyEmployeeExtended,
                v2: CompanyEmployeeFull,
            },
            v1: []const CompanyEmployee,
        }) = .absent,
        profile: model.Presence(union(enum) {
            v0: union(enum) {
                v0: CompanyProfile,
                v1: CompanyProfileExtended,
            },
            v1: CompanyProfile,
        }) = .absent,
        news: model.Presence([]const News) = .absent,
        _metadata: model.Presence(RequestMetadataWithLinks) = .absent,
        stock: model.Presence([]const CompanyStockItem) = .absent,
        selections: model.Presence([]const CompanySelectionName) = .absent,
        timestamp: model.Presence(i64) = .absent,
        pub const json_schema = "{\"type\":\"object\",\"properties\":{\"applications\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/CompanyApplication\"}},\"employees\":{\"anyOf\":[{\"type\":\"array\",\"items\":{\"oneOf\":[{\"$ref\":\"#/components/schemas/CompanyEmployee\"},{\"$ref\":\"#/components/schemas/CompanyEmployeeExtended\"},{\"$ref\":\"#/components/schemas/CompanyEmployeeFull\"}]}},{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/CompanyEmployee\"}}]},\"profile\":{\"anyOf\":[{\"oneOf\":[{\"$ref\":\"#/components/schemas/CompanyProfile\"},{\"$ref\":\"#/components/schemas/CompanyProfileExtended\"}]},{\"$ref\":\"#/components/schemas/CompanyProfile\"}]},\"news\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/News\"}},\"_metadata\":{\"$ref\":\"#/components/schemas/RequestMetadataWithLinks\"},\"stock\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/CompanyStockItem\"}},\"selections\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/CompanySelectionName\"}},\"timestamp\":{\"type\":\"integer\",\"format\":\"int32\"}}}";
    };
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Company\"],\"summary\":\"Get any Company selection\",\"description\":\"Key access level depends on the required selections. <br> Choose one or more selections (comma separated).\",\"operationId\":\"getCompanyGeneric\",\"parameters\":[{\"name\":\"selections\",\"in\":\"query\",\"description\":\"Selection names\",\"required\":false,\"style\":\"form\",\"explode\":false,\"schema\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/CompanySelectionName\"}}},{\"name\":\"id\",\"in\":\"query\",\"description\":\"selection id\",\"required\":false,\"schema\":{\"oneOf\":[{\"$ref\":\"#/components/schemas/CompanyId\"}]}},{\"name\":\"legacy\",\"in\":\"query\",\"description\":\"Legacy selection names for which you want or expect API v1 response\",\"required\":false,\"style\":\"form\",\"explode\":false,\"schema\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/CompanySelectionName\"}}},{\"name\":\"cat\",\"in\":\"query\",\"description\":\"Selection category\",\"required\":false,\"schema\":{\"oneOf\":[{\"$ref\":\"#/components/schemas/CompanyNewsCategory\"}]}},{\"$ref\":\"#/components/parameters/ApiLimit\"},{\"$ref\":\"#/components/parameters/ApiStripTags\"},{\"$ref\":\"#/components/parameters/ApiOffsetNoDefault\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"anyOf\":[{\"$ref\":\"#/components/schemas/CompanyApplicationsResponse\"},{\"$ref\":\"#/components/schemas/CompanyEmployeesResponse\"},{\"$ref\":\"#/components/schemas/CompanyEmployeesResponseBasic\"},{\"$ref\":\"#/components/schemas/CompanyProfileResponseMixed\"},{\"$ref\":\"#/components/schemas/CompanyProfileResponse\"},{\"$ref\":\"#/components/schemas/NewsResponse\"},{\"$ref\":\"#/components/schemas/CompanyStockResponse\"},{\"$ref\":\"#/components/schemas/CompanyLookupResponse\"},{\"$ref\":\"#/components/schemas/TimestampResponse\"}]}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getForumCategories = struct {
    pub const operation_id = "getForumCategories";
    pub const path = "/forum/categories";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = ForumCategoriesResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Forum\"],\"summary\":\"Get publicly available forum categories\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getForumCategories\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/ForumCategoriesResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getForumThreadPosts = struct {
    pub const operation_id = "getForumThreadPosts";
    pub const path = "/forum/{threadId}/posts";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        striptags: model.Presence(enum {
            true,
            false,
        }) = .absent,
        offset: model.Presence(i64) = .absent,
        sort: model.Presence(enum {
            DESC,
            ASC,
        }) = .absent,
        from: model.Presence(i64) = .absent,
        to: model.Presence(i64) = .absent,
        threadId: ForumThreadId,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = ForumPostsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Forum\"],\"summary\":\"Get specific forum thread posts\",\"description\":\"Requires public access key. <br>Returns 20 posts per page for a specific thread. <br> By default, it uses 'offset', but it's possible to filter posts with 'from' & 'to' parameters.\",\"operationId\":\"getForumThreadPosts\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiStripTagsTrue\"},{\"$ref\":\"#/components/parameters/ApiOffsetNoDefault\"},{\"$ref\":\"#/components/parameters/ApiSort\"},{\"$ref\":\"#/components/parameters/ApiFrom\"},{\"$ref\":\"#/components/parameters/ApiTo\"},{\"name\":\"threadId\",\"in\":\"path\",\"description\":\"Thread id\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/ForumThreadId\"}},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/ForumPostsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getForumThread = struct {
    pub const operation_id = "getForumThread";
    pub const path = "/forum/{threadId}/thread";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        threadId: ForumThreadId,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = ForumThreadResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Forum\"],\"summary\":\"Get specific thread details\",\"description\":\"Requires public access key. <br>Contains details of a thread including topic content and poll (if any).\",\"operationId\":\"getForumThread\",\"parameters\":[{\"name\":\"threadId\",\"in\":\"path\",\"description\":\"Thread id\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/ForumThreadId\"}},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/ForumThreadResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getForumAllThreads = struct {
    pub const operation_id = "getForumAllThreads";
    pub const path = "/forum/threads";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        limit: model.Presence(i64) = .absent,
        sort: model.Presence(enum {
            DESC,
            ASC,
        }) = .absent,
        from: model.Presence(i64) = .absent,
        to: model.Presence(i64) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = ForumThreadsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Forum\"],\"summary\":\"Get threads across all forum categories\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getForumAllThreads\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiLimit100\"},{\"$ref\":\"#/components/parameters/ApiSort\"},{\"$ref\":\"#/components/parameters/ApiFrom\"},{\"$ref\":\"#/components/parameters/ApiTo\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/ForumThreadsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getForumThreads = struct {
    pub const operation_id = "getForumThreads";
    pub const path = "/forum/{categoryIds}/threads";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        limit: model.Presence(i64) = .absent,
        sort: model.Presence(enum {
            DESC,
            ASC,
        }) = .absent,
        from: model.Presence(i64) = .absent,
        to: model.Presence(i64) = .absent,
        categoryIds: []const ForumId,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = ForumThreadsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Forum\"],\"summary\":\"Get threads for specific public forum category or categories\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getForumThreads\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiLimit100\"},{\"$ref\":\"#/components/parameters/ApiSort\"},{\"$ref\":\"#/components/parameters/ApiFrom\"},{\"$ref\":\"#/components/parameters/ApiTo\"},{\"name\":\"categoryIds\",\"in\":\"path\",\"description\":\"Category id or a list of category ids (comma separated)\",\"required\":true,\"style\":\"form\",\"explode\":false,\"schema\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/ForumId\"}}},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/ForumThreadsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getForumLookup = struct {
    pub const operation_id = "getForumLookup";
    pub const path = "/forum/lookup";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = ForumLookupResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Forum\"],\"summary\":\"Get all available forum selections\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getForumLookup\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/ForumLookupResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getForumTimestamp = struct {
    pub const operation_id = "getForumTimestamp";
    pub const path = "/forum/timestamp";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = TimestampResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Forum\"],\"summary\":\"Get current server time\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getForumTimestamp\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/TimestampResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getForumGeneric = struct {
    pub const operation_id = "getForumGeneric";
    pub const path = "/forum";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        selections: model.Presence([]const ForumSelectionName) = .absent,
        id: model.Presence(union(enum) {
            v0: ForumThreadId,
            v1: []const ForumId,
        }) = .absent,
        striptags: model.Presence(enum {
            true,
            false,
        }) = .absent,
        limit: model.Presence(i64) = .absent,
        sort: model.Presence(enum {
            DESC,
            ASC,
        }) = .absent,
        from: model.Presence(i64) = .absent,
        to: model.Presence(i64) = .absent,
        offset: model.Presence(i64) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = struct {
        categories: model.Presence([]const struct {
            id: ForumId,
            title: []const u8,
            acronym: []const u8,
            threads: i64,
            pub const json_schema = "{\"required\":[\"id\",\"title\",\"acronym\",\"threads\"],\"properties\":{\"id\":{\"$ref\":\"#/components/schemas/ForumId\"},\"title\":{\"type\":\"string\"},\"acronym\":{\"type\":\"string\"},\"threads\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}";
        }) = .absent,
        threads: model.Presence([]const ForumThreadBase) = .absent,
        _metadata: model.Presence(RequestMetadataWithLinks) = .absent,
        thread: model.Presence(ForumThreadExtended) = .absent,
        posts: model.Presence([]const ForumPost) = .absent,
        selections: model.Presence([]const ForumSelectionName) = .absent,
        timestamp: model.Presence(i64) = .absent,
        pub const json_schema = "{\"type\":\"object\",\"properties\":{\"categories\":{\"type\":\"array\",\"items\":{\"required\":[\"id\",\"title\",\"acronym\",\"threads\"],\"properties\":{\"id\":{\"$ref\":\"#/components/schemas/ForumId\"},\"title\":{\"type\":\"string\"},\"acronym\":{\"type\":\"string\"},\"threads\":{\"type\":\"integer\",\"format\":\"int32\"}},\"type\":\"object\"}},\"threads\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/ForumThreadBase\"}},\"_metadata\":{\"$ref\":\"#/components/schemas/RequestMetadataWithLinks\"},\"thread\":{\"$ref\":\"#/components/schemas/ForumThreadExtended\"},\"posts\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/ForumPost\"}},\"selections\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/ForumSelectionName\"}},\"timestamp\":{\"type\":\"integer\",\"format\":\"int32\"}}}";
    };
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Forum\"],\"summary\":\"Get any Forum selection\",\"description\":\"Requires public access key. <br>Choose one or more selections (comma separated).\",\"operationId\":\"getForumGeneric\",\"parameters\":[{\"name\":\"selections\",\"in\":\"query\",\"description\":\"Selection names\",\"required\":false,\"style\":\"form\",\"explode\":false,\"schema\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/ForumSelectionName\"}}},{\"name\":\"id\",\"in\":\"query\",\"description\":\"selection id\",\"required\":false,\"schema\":{\"oneOf\":[{\"$ref\":\"#/components/schemas/ForumThreadId\"},{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/ForumId\"}}]}},{\"$ref\":\"#/components/parameters/ApiStripTags\"},{\"$ref\":\"#/components/parameters/ApiLimit\"},{\"$ref\":\"#/components/parameters/ApiSort\"},{\"$ref\":\"#/components/parameters/ApiFrom\"},{\"$ref\":\"#/components/parameters/ApiTo\"},{\"$ref\":\"#/components/parameters/ApiOffsetNoDefault\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"anyOf\":[{\"$ref\":\"#/components/schemas/ForumCategoriesResponse\"},{\"$ref\":\"#/components/schemas/ForumThreadsResponse\"},{\"$ref\":\"#/components/schemas/ForumThreadResponse\"},{\"$ref\":\"#/components/schemas/ForumPostsResponse\"},{\"$ref\":\"#/components/schemas/ForumLookupResponse\"},{\"$ref\":\"#/components/schemas/TimestampResponse\"}]}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getKeyLog = struct {
    pub const operation_id = "getKeyLog";
    pub const path = "/key/log";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        limit: model.Presence(i64) = .absent,
        offset: model.Presence(i64) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = KeyLogResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Key\"],\"summary\":\"Get current key log history\",\"description\":\"Available for any key. <br>\\n * This selection contains up to last 250 request logs.\",\"operationId\":\"getKeyLog\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiLimit100\"},{\"$ref\":\"#/components/parameters/ApiOffsetNoDefault\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/KeyLogResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getKeyInfo = struct {
    pub const operation_id = "getKeyInfo";
    pub const path = "/key/info";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = KeyInfoResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Key\"],\"summary\":\"Get current key info\",\"description\":\"Available for any key. <br>\",\"operationId\":\"getKeyInfo\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/KeyInfoResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getKeyGeneric = struct {
    pub const operation_id = "getKeyGeneric";
    pub const path = "/key";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        selections: model.Presence([]const KeySelectionName) = .absent,
        limit: model.Presence(i64) = .absent,
        offset: model.Presence(i64) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = struct {
        info: model.Presence(struct {
            selections: struct {
                company: []const []const u8,
                faction: []const FactionSelectionName,
                market: []const MarketSelectionName,
                property: []const []const u8,
                torn: []const TornSelectionName,
                user: []const UserSelectionName,
                racing: []const RacingSelectionName,
                forum: []const ForumSelectionName,
                key: []const KeySelectionName,
                pub const json_schema = "{\"required\":[\"company\",\"faction\",\"market\",\"property\",\"torn\",\"user\",\"racing\",\"forum\",\"key\"],\"properties\":{\"company\":{\"type\":\"array\",\"items\":{\"type\":\"string\"}},\"faction\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/FactionSelectionName\"}},\"market\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/MarketSelectionName\"}},\"property\":{\"type\":\"array\",\"items\":{\"type\":\"string\"}},\"torn\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/TornSelectionName\"}},\"user\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/UserSelectionName\"}},\"racing\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/RacingSelectionName\"}},\"forum\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/ForumSelectionName\"}},\"key\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/KeySelectionName\"}}},\"type\":\"object\"}";
            },
            user: struct {
                faction_id: ?FactionId,
                company_id: ?CompanyId,
                id: UserId,
                pub const json_schema = "{\"required\":[\"id\",\"faction_id\",\"company_id\"],\"properties\":{\"faction_id\":{\"description\":\"Null only if the user is not in a faction.\",\"oneOf\":[{\"$ref\":\"#/components/schemas/FactionId\"},{\"type\":\"null\"}]},\"company_id\":{\"description\":\"Null only if the user is not in a company.\",\"oneOf\":[{\"$ref\":\"#/components/schemas/CompanyId\"},{\"type\":\"null\"}]},\"id\":{\"$ref\":\"#/components/schemas/UserId\"}},\"type\":\"object\"}";
            },
            access: struct {
                level: i64,
                type: ApiKeyAccessTypeEnum,
                faction: bool,
                company: bool,
                log: struct {
                    custom_permissions: bool,
                    available: []const KeyInfoAvailableLog,
                    pub const json_schema = "{\"required\":[\"custom_permissions\",\"available\"],\"properties\":{\"custom_permissions\":{\"description\":\"Shows if key has custom log permissions enabled.\",\"type\":\"boolean\"},\"available\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/KeyInfoAvailableLog\"}}},\"type\":\"object\"}";
                },
                pub const json_schema = "{\"required\":[\"level\",\"type\",\"faction\",\"company\",\"log\"],\"properties\":{\"level\":{\"type\":\"integer\",\"format\":\"int32\"},\"type\":{\"$ref\":\"#/components/schemas/ApiKeyAccessTypeEnum\"},\"faction\":{\"type\":\"boolean\"},\"company\":{\"type\":\"boolean\"},\"log\":{\"required\":[\"custom_permissions\",\"available\"],\"properties\":{\"custom_permissions\":{\"description\":\"Shows if key has custom log permissions enabled.\",\"type\":\"boolean\"},\"available\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/KeyInfoAvailableLog\"}}},\"type\":\"object\"}},\"type\":\"object\"}";
            },
            pub const json_schema = "{\"required\":[\"selections\",\"access\",\"user\"],\"properties\":{\"selections\":{\"required\":[\"company\",\"faction\",\"market\",\"property\",\"torn\",\"user\",\"racing\",\"forum\",\"key\"],\"properties\":{\"company\":{\"type\":\"array\",\"items\":{\"type\":\"string\"}},\"faction\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/FactionSelectionName\"}},\"market\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/MarketSelectionName\"}},\"property\":{\"type\":\"array\",\"items\":{\"type\":\"string\"}},\"torn\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/TornSelectionName\"}},\"user\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/UserSelectionName\"}},\"racing\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/RacingSelectionName\"}},\"forum\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/ForumSelectionName\"}},\"key\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/KeySelectionName\"}}},\"type\":\"object\"},\"user\":{\"required\":[\"id\",\"faction_id\",\"company_id\"],\"properties\":{\"faction_id\":{\"description\":\"Null only if the user is not in a faction.\",\"oneOf\":[{\"$ref\":\"#/components/schemas/FactionId\"},{\"type\":\"null\"}]},\"company_id\":{\"description\":\"Null only if the user is not in a company.\",\"oneOf\":[{\"$ref\":\"#/components/schemas/CompanyId\"},{\"type\":\"null\"}]},\"id\":{\"$ref\":\"#/components/schemas/UserId\"}},\"type\":\"object\"},\"access\":{\"required\":[\"level\",\"type\",\"faction\",\"company\",\"log\"],\"properties\":{\"level\":{\"type\":\"integer\",\"format\":\"int32\"},\"type\":{\"$ref\":\"#/components/schemas/ApiKeyAccessTypeEnum\"},\"faction\":{\"type\":\"boolean\"},\"company\":{\"type\":\"boolean\"},\"log\":{\"required\":[\"custom_permissions\",\"available\"],\"properties\":{\"custom_permissions\":{\"description\":\"Shows if key has custom log permissions enabled.\",\"type\":\"boolean\"},\"available\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/KeyInfoAvailableLog\"}}},\"type\":\"object\"}},\"type\":\"object\"}},\"type\":\"object\"}";
        }) = .absent,
        log: model.Presence([]const struct {
            timestamp: i64,
            type: []const u8,
            selections: []const u8,
            id: union(enum) {
                v0: i64,
                v1: []const u8,
                v2: void,
            },
            comment: model.Presence(?[]const u8) = .absent,
            ip: []const u8,
            pub const json_schema = "{\"required\":[\"timestamp\",\"type\",\"selections\",\"id\",\"ip\"],\"properties\":{\"timestamp\":{\"type\":\"integer\",\"format\":\"int32\"},\"type\":{\"type\":\"string\"},\"selections\":{\"type\":\"string\"},\"id\":{\"oneOf\":[{\"type\":\"integer\",\"format\":\"int64\"},{\"type\":\"string\"},{\"type\":\"null\"}]},\"comment\":{\"oneOf\":[{\"type\":\"string\"},{\"type\":\"null\"}]},\"ip\":{\"type\":\"string\"}},\"type\":\"object\"}";
        }) = .absent,
        pub const json_schema = "{\"type\":\"object\",\"properties\":{\"info\":{\"required\":[\"selections\",\"access\",\"user\"],\"properties\":{\"selections\":{\"required\":[\"company\",\"faction\",\"market\",\"property\",\"torn\",\"user\",\"racing\",\"forum\",\"key\"],\"properties\":{\"company\":{\"type\":\"array\",\"items\":{\"type\":\"string\"}},\"faction\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/FactionSelectionName\"}},\"market\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/MarketSelectionName\"}},\"property\":{\"type\":\"array\",\"items\":{\"type\":\"string\"}},\"torn\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/TornSelectionName\"}},\"user\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/UserSelectionName\"}},\"racing\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/RacingSelectionName\"}},\"forum\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/ForumSelectionName\"}},\"key\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/KeySelectionName\"}}},\"type\":\"object\"},\"user\":{\"required\":[\"id\",\"faction_id\",\"company_id\"],\"properties\":{\"faction_id\":{\"description\":\"Null only if the user is not in a faction.\",\"oneOf\":[{\"$ref\":\"#/components/schemas/FactionId\"},{\"type\":\"null\"}]},\"company_id\":{\"description\":\"Null only if the user is not in a company.\",\"oneOf\":[{\"$ref\":\"#/components/schemas/CompanyId\"},{\"type\":\"null\"}]},\"id\":{\"$ref\":\"#/components/schemas/UserId\"}},\"type\":\"object\"},\"access\":{\"required\":[\"level\",\"type\",\"faction\",\"company\",\"log\"],\"properties\":{\"level\":{\"type\":\"integer\",\"format\":\"int32\"},\"type\":{\"$ref\":\"#/components/schemas/ApiKeyAccessTypeEnum\"},\"faction\":{\"type\":\"boolean\"},\"company\":{\"type\":\"boolean\"},\"log\":{\"required\":[\"custom_permissions\",\"available\"],\"properties\":{\"custom_permissions\":{\"description\":\"Shows if key has custom log permissions enabled.\",\"type\":\"boolean\"},\"available\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/KeyInfoAvailableLog\"}}},\"type\":\"object\"}},\"type\":\"object\"}},\"type\":\"object\"},\"log\":{\"type\":\"array\",\"items\":{\"required\":[\"timestamp\",\"type\",\"selections\",\"id\",\"ip\"],\"properties\":{\"timestamp\":{\"type\":\"integer\",\"format\":\"int32\"},\"type\":{\"type\":\"string\"},\"selections\":{\"type\":\"string\"},\"id\":{\"oneOf\":[{\"type\":\"integer\",\"format\":\"int64\"},{\"type\":\"string\"},{\"type\":\"null\"}]},\"comment\":{\"oneOf\":[{\"type\":\"string\"},{\"type\":\"null\"}]},\"ip\":{\"type\":\"string\"}},\"type\":\"object\"}}}}";
    };
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Key\"],\"summary\":\"Get any Key selection\",\"operationId\":\"getKeyGeneric\",\"parameters\":[{\"name\":\"selections\",\"in\":\"query\",\"description\":\"Selection names\",\"required\":false,\"style\":\"form\",\"explode\":false,\"schema\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/KeySelectionName\"}}},{\"$ref\":\"#/components/parameters/ApiLimit100\"},{\"$ref\":\"#/components/parameters/ApiOffsetNoDefault\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"anyOf\":[{\"$ref\":\"#/components/schemas/KeyInfoResponse\"},{\"$ref\":\"#/components/schemas/KeyLogResponse\"}]}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMarketAuctionHouseListing = struct {
    pub const operation_id = "getMarketAuctionHouseListing";
    pub const path = "/market/{id}/auctionhouselisting";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        id: AuctionListingId,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = AuctionHouseListingResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Market\"],\"summary\":\"Get specific item auction house listings\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getMarketAuctionHouseListing\",\"parameters\":[{\"name\":\"id\",\"in\":\"path\",\"description\":\"Listing id\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/AuctionListingId\"}},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/AuctionHouseListingResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMarketAuctionHouseItem = struct {
    pub const operation_id = "getMarketAuctionHouseItem";
    pub const path = "/market/{id}/auctionhouse";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        id: ItemId,
        limit: model.Presence(i64) = .absent,
        sort: model.Presence(enum {
            DESC,
            ASC,
        }) = .absent,
        from: model.Presence(i64) = .absent,
        to: model.Presence(i64) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = AuctionHouseResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Market\"],\"summary\":\"Get specific item auction house listings\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getMarketAuctionHouseItem\",\"parameters\":[{\"name\":\"id\",\"in\":\"path\",\"description\":\"Item id\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/ItemId\"}},{\"$ref\":\"#/components/parameters/ApiLimit100Default20\"},{\"$ref\":\"#/components/parameters/ApiSort\"},{\"$ref\":\"#/components/parameters/ApiFrom\"},{\"$ref\":\"#/components/parameters/ApiTo\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/AuctionHouseResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMarketAuctionHouse = struct {
    pub const operation_id = "getMarketAuctionHouse";
    pub const path = "/market/auctionhouse";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        limit: model.Presence(i64) = .absent,
        sort: model.Presence(enum {
            DESC,
            ASC,
        }) = .absent,
        from: model.Presence(i64) = .absent,
        to: model.Presence(i64) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = AuctionHouseResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Market\"],\"summary\":\"Get auction house listings\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getMarketAuctionHouse\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiLimit100Default20\"},{\"$ref\":\"#/components/parameters/ApiSort\"},{\"$ref\":\"#/components/parameters/ApiFrom\"},{\"$ref\":\"#/components/parameters/ApiTo\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/AuctionHouseResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMarketBazaar = struct {
    pub const operation_id = "getMarketBazaar";
    pub const path = "/market/bazaar";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        cat: model.Presence(MarketSpecializedBazaarCategoryEnum) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = BazaarResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Market\"],\"summary\":\"Get bazaar directory\",\"description\":\"Requires public access key. <br> The default response is of type 'BazaarWeekly', but if a category is chosen, the response will be of type 'BazaarSpecialized'.\",\"operationId\":\"getMarketBazaar\",\"parameters\":[{\"name\":\"cat\",\"in\":\"query\",\"description\":\"Category of specialized bazaars returned\",\"required\":false,\"schema\":{\"$ref\":\"#/components/schemas/MarketSpecializedBazaarCategoryEnum\"}},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/BazaarResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMarketBazaarItem = struct {
    pub const operation_id = "getMarketBazaarItem";
    pub const path = "/market/{id}/bazaar";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        id: ItemId,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = BazaarResponseSpecialized;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Market\"],\"summary\":\"Get item specialized bazaar directory\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getMarketBazaarItem\",\"parameters\":[{\"name\":\"id\",\"in\":\"path\",\"description\":\"Item id\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/ItemId\"}},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/BazaarResponseSpecialized\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMarketItemMarketItem = struct {
    pub const operation_id = "getMarketItemMarketItem";
    pub const path = "/market/{id}/itemmarket";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        id: ItemId,
        bonus: model.Presence(WeaponBonusEnum) = .absent,
        limit: model.Presence(i64) = .absent,
        offset: model.Presence(i64) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = MarketItemMarketResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Market\"],\"summary\":\"Get item market listings\",\"description\":\"<b>Globally cached selection.</b><br><br>Requires public access key. <br>\",\"operationId\":\"getMarketItemMarketItem\",\"parameters\":[{\"name\":\"id\",\"in\":\"path\",\"description\":\"Item id\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/ItemId\"}},{\"name\":\"bonus\",\"in\":\"query\",\"description\":\"Used to filter weapons with a specific bonus.\",\"required\":false,\"schema\":{\"$ref\":\"#/components/schemas/WeaponBonusEnum\"}},{\"$ref\":\"#/components/parameters/ApiLimit100Default20\"},{\"$ref\":\"#/components/parameters/ApiOffset\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/MarketItemMarketResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMarketProperties = struct {
    pub const operation_id = "getMarketProperties";
    pub const path = "/market/{propertyTypeId}/properties";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        propertyTypeId: PropertyTypeId,
        offset: model.Presence(i64) = .absent,
        limit: model.Presence(i64) = .absent,
        sort: model.Presence(enum {
            DESC,
            ASC,
        }) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = MarketPropertiesResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Market\"],\"summary\":\"Get properties market listings\",\"description\":\"<b>Globally cached selection.</b><br><br>Requires public access key. <br>\",\"operationId\":\"getMarketProperties\",\"parameters\":[{\"name\":\"propertyTypeId\",\"in\":\"path\",\"description\":\"Property type id\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/PropertyTypeId\"}},{\"$ref\":\"#/components/parameters/ApiOffset\"},{\"$ref\":\"#/components/parameters/ApiLimit100Default20\"},{\"$ref\":\"#/components/parameters/ApiSort\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/MarketPropertiesResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMarketPoints = struct {
    pub const operation_id = "getMarketPoints";
    pub const path = "/market/pointsmarket";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = PointsMarketResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Market\"],\"summary\":\"Get points market listings\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getMarketPoints\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/PointsMarketResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMarketPropertiesRental = struct {
    pub const operation_id = "getMarketPropertiesRental";
    pub const path = "/market/{propertyTypeId}/rentals";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        propertyTypeId: PropertyTypeId,
        offset: model.Presence(i64) = .absent,
        limit: model.Presence(i64) = .absent,
        sort: model.Presence(enum {
            DESC,
            ASC,
        }) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = MarketRentalsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Market\"],\"summary\":\"Get properties rental listings\",\"description\":\"<b>Globally cached selection.</b><br><br>Requires public access key. <br>\",\"operationId\":\"getMarketPropertiesRental\",\"parameters\":[{\"name\":\"propertyTypeId\",\"in\":\"path\",\"description\":\"Property type id\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/PropertyTypeId\"}},{\"$ref\":\"#/components/parameters/ApiOffset\"},{\"$ref\":\"#/components/parameters/ApiLimit100Default20\"},{\"$ref\":\"#/components/parameters/ApiSort\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/MarketRentalsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMarketLookup = struct {
    pub const operation_id = "getMarketLookup";
    pub const path = "/market/lookup";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = MarketLookupResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Market\"],\"summary\":\"Get all available market selections\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getMarketLookup\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/MarketLookupResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMarketTimestamp = struct {
    pub const operation_id = "getMarketTimestamp";
    pub const path = "/market/timestamp";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = TimestampResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Market\"],\"summary\":\"Get current server time\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getMarketTimestamp\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/TimestampResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getMarketGeneric = struct {
    pub const operation_id = "getMarketGeneric";
    pub const path = "/market";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        selections: model.Presence([]const MarketSelectionName) = .absent,
        id: model.Presence(union(enum) {
            v0: ItemId,
            v1: AuctionListingId,
            v2: PropertyTypeId,
        }) = .absent,
        legacy: model.Presence([]const MarketSelectionName) = .absent,
        cat: model.Presence(MarketSpecializedBazaarCategoryEnum) = .absent,
        bonus: model.Presence(WeaponBonusEnum) = .absent,
        sort: model.Presence(enum {
            DESC,
            ASC,
        }) = .absent,
        offset: model.Presence(i64) = .absent,
        limit: model.Presence(i64) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = struct {
        bazaar: model.Presence(union(enum) {
            v0: union(enum) {
                v0: BazaarWeekly,
                v1: BazaarSpecialized,
            },
            v1: BazaarSpecialized,
        }) = .absent,
        itemmarket: model.Presence(ItemMarket) = .absent,
        _metadata: model.Presence(union(enum) {
            v0: RequestMetadataWithLinksAndTotal,
            v1: RequestMetadataWithLinks,
        }) = .absent,
        rentals: model.Presence(MarketRentalDetails) = .absent,
        rentals_timestamp: model.Presence(i64) = .absent,
        rentals_delay: model.Presence(i64) = .absent,
        auctionhouse: model.Presence([]const AuctionHouseListing) = .absent,
        auctionhouselisting: model.Presence(AuctionHouseListing) = .absent,
        pointsmarket: model.Presence([]const struct {
            id: i64,
            quantity: i64,
            cost: i64,
            total_cost: i64,
            pub const json_schema = "{\"required\":[\"id\",\"quantity\",\"cost\",\"total_cost\"],\"properties\":{\"id\":{\"type\":\"integer\",\"format\":\"int32\"},\"quantity\":{\"type\":\"integer\",\"format\":\"int32\"},\"cost\":{\"type\":\"integer\",\"format\":\"int32\"},\"total_cost\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}";
        }) = .absent,
        properties: model.Presence(MarketPropertyDetails) = .absent,
        properties_timestamp: model.Presence(i64) = .absent,
        properties_delay: model.Presence(i64) = .absent,
        selections: model.Presence([]const MarketSelectionName) = .absent,
        timestamp: model.Presence(i64) = .absent,
        pub const json_schema = "{\"type\":\"object\",\"properties\":{\"bazaar\":{\"anyOf\":[{\"description\":\"If there's a specific item ID passed or a category chosen, the response will be of type 'BazaarSpecialized', otherwise it will be 'BazaarWeekly'.\",\"oneOf\":[{\"$ref\":\"#/components/schemas/BazaarWeekly\"},{\"$ref\":\"#/components/schemas/BazaarSpecialized\"}]},{\"$ref\":\"#/components/schemas/BazaarSpecialized\"}]},\"itemmarket\":{\"$ref\":\"#/components/schemas/ItemMarket\"},\"_metadata\":{\"anyOf\":[{\"$ref\":\"#/components/schemas/RequestMetadataWithLinksAndTotal\"},{\"$ref\":\"#/components/schemas/RequestMetadataWithLinks\"}]},\"rentals\":{\"$ref\":\"#/components/schemas/MarketRentalDetails\"},\"rentals_timestamp\":{\"type\":\"integer\",\"format\":\"int32\"},\"rentals_delay\":{\"description\":\"The minimum amount of time needed before the cache timestamp can change.\",\"type\":\"integer\",\"format\":\"int32\"},\"auctionhouse\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/AuctionHouseListing\"}},\"auctionhouselisting\":{\"$ref\":\"#/components/schemas/AuctionHouseListing\"},\"pointsmarket\":{\"type\":\"array\",\"items\":{\"required\":[\"id\",\"quantity\",\"cost\",\"total_cost\"],\"properties\":{\"id\":{\"type\":\"integer\",\"format\":\"int32\"},\"quantity\":{\"type\":\"integer\",\"format\":\"int32\"},\"cost\":{\"type\":\"integer\",\"format\":\"int32\"},\"total_cost\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}},\"properties\":{\"$ref\":\"#/components/schemas/MarketPropertyDetails\"},\"properties_timestamp\":{\"type\":\"integer\",\"format\":\"int32\"},\"properties_delay\":{\"description\":\"The minimum amount of time needed before the cache timestamp can change.\",\"type\":\"integer\",\"format\":\"int32\"},\"selections\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/MarketSelectionName\"}},\"timestamp\":{\"type\":\"integer\",\"format\":\"int32\"}}}";
    };
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Market\"],\"summary\":\"Get any Market selection\",\"description\":\"Requires public access key. <br>Choose one or more selections (comma separated).\",\"operationId\":\"getMarketGeneric\",\"parameters\":[{\"name\":\"selections\",\"in\":\"query\",\"description\":\"Selection names\",\"required\":false,\"style\":\"form\",\"explode\":false,\"schema\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/MarketSelectionName\"}}},{\"name\":\"id\",\"in\":\"query\",\"description\":\"selection id\",\"required\":false,\"schema\":{\"oneOf\":[{\"$ref\":\"#/components/schemas/ItemId\"},{\"$ref\":\"#/components/schemas/AuctionListingId\"},{\"$ref\":\"#/components/schemas/PropertyTypeId\"}]}},{\"name\":\"legacy\",\"in\":\"query\",\"description\":\"Legacy selection names for which you want or expect API v1 response\",\"required\":false,\"style\":\"form\",\"explode\":false,\"schema\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/MarketSelectionName\"}}},{\"name\":\"cat\",\"in\":\"query\",\"description\":\"Category of specialized bazaars returned\",\"required\":false,\"schema\":{\"$ref\":\"#/components/schemas/MarketSpecializedBazaarCategoryEnum\"}},{\"name\":\"bonus\",\"in\":\"query\",\"description\":\"Used to filter weapons with a specific bonus\",\"required\":false,\"schema\":{\"$ref\":\"#/components/schemas/WeaponBonusEnum\"}},{\"name\":\"sort\",\"in\":\"query\",\"description\":\"Direction to sort rows in\",\"required\":false,\"schema\":{\"type\":\"string\",\"enum\":[\"DESC\",\"ASC\"]}},{\"$ref\":\"#/components/parameters/ApiOffsetNoDefault\"},{\"$ref\":\"#/components/parameters/ApiLimit100Default20\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"anyOf\":[{\"$ref\":\"#/components/schemas/BazaarResponse\"},{\"$ref\":\"#/components/schemas/BazaarResponseSpecialized\"},{\"$ref\":\"#/components/schemas/MarketItemMarketResponse\"},{\"$ref\":\"#/components/schemas/MarketRentalsResponse\"},{\"$ref\":\"#/components/schemas/AuctionHouseResponse\"},{\"$ref\":\"#/components/schemas/AuctionHouseListingResponse\"},{\"$ref\":\"#/components/schemas/PointsMarketResponse\"},{\"$ref\":\"#/components/schemas/MarketPropertiesResponse\"},{\"$ref\":\"#/components/schemas/MarketLookupResponse\"},{\"$ref\":\"#/components/schemas/TimestampResponse\"}]}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getRacingCars = struct {
    pub const operation_id = "getRacingCars";
    pub const path = "/racing/cars";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = RacingCarsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Racing\"],\"summary\":\"Get cars and their racing stats\",\"description\":\"Requires public access key. <br>Returns the stat details about racing cars.\",\"operationId\":\"getRacingCars\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/RacingCarsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getRacingCarUpgrades = struct {
    pub const operation_id = "getRacingCarUpgrades";
    pub const path = "/racing/carupgrades";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = RacingCarUpgradesResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Racing\"],\"summary\":\"Get all possible car upgrades\",\"description\":\"Requires public access key. <br>Returns the details about all possible car upgrades.\",\"operationId\":\"getRacingCarUpgrades\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/RacingCarUpgradesResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getRacingRaces = struct {
    pub const operation_id = "getRacingRaces";
    pub const path = "/racing/races";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        limit: model.Presence(i64) = .absent,
        sort: model.Presence(enum {
            DESC,
            ASC,
        }) = .absent,
        to: model.Presence(i64) = .absent,
        from: model.Presence(i64) = .absent,
        cat: model.Presence(RacingRaceTypeEnum) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = RacingRacesResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Racing\"],\"summary\":\"Get races\",\"description\":\"Requires public access key. <br>Returns a list of races, ordered by race start timestamp.\",\"operationId\":\"getRacingRaces\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiLimit100\"},{\"$ref\":\"#/components/parameters/ApiSortDesc\"},{\"$ref\":\"#/components/parameters/ApiTo\"},{\"$ref\":\"#/components/parameters/ApiFrom\"},{\"name\":\"cat\",\"in\":\"query\",\"description\":\"Category of races returned\",\"required\":false,\"schema\":{\"$ref\":\"#/components/schemas/RacingRaceTypeEnum\"}},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/RacingRacesResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getRacingRaceDetails = struct {
    pub const operation_id = "getRacingRaceDetails";
    pub const path = "/racing/{raceId}/race";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        raceId: RaceId,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = RacingRaceDetailsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Racing\"],\"summary\":\"Get specific race details\",\"description\":\"Requires public access key. <br>Returns the details of a race.\",\"operationId\":\"getRacingRaceDetails\",\"parameters\":[{\"name\":\"raceId\",\"in\":\"path\",\"description\":\"Race id\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/RaceId\"}},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/RacingRaceDetailsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getRacingTrackRecords = struct {
    pub const operation_id = "getRacingTrackRecords";
    pub const path = "/racing/{trackId}/records";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        trackId: RaceTrackId,
        cat: RaceClassEnum,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = RacingTrackRecordsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Racing\"],\"summary\":\"Get track records\",\"description\":\"Requires public access key. <br>Returns a list of 5 best lap records for the chosen track and car class.\",\"operationId\":\"getRacingTrackRecords\",\"parameters\":[{\"name\":\"trackId\",\"in\":\"path\",\"description\":\"Track id\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/RaceTrackId\"}},{\"name\":\"cat\",\"in\":\"query\",\"description\":\"Car class\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/RaceClassEnum\"}},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/RacingTrackRecordsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getRacingTracks = struct {
    pub const operation_id = "getRacingTracks";
    pub const path = "/racing/tracks";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = RacingTracksResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Racing\"],\"summary\":\"Get race tracks and descriptions\",\"description\":\"Requires public access key. <br>Returns the details about racing tracks.\",\"operationId\":\"getRacingTracks\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/RacingTracksResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getRacingLookup = struct {
    pub const operation_id = "getRacingLookup";
    pub const path = "/racing/lookup";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = RacingLookupResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Racing\"],\"summary\":\"Get all available racing selections\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getRacingLookup\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/RacingLookupResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getRacingTimestamp = struct {
    pub const operation_id = "getRacingTimestamp";
    pub const path = "/racing/timestamp";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = TimestampResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Racing\"],\"summary\":\"Get current server time\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getRacingTimestamp\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/TimestampResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getRacingGeneric = struct {
    pub const operation_id = "getRacingGeneric";
    pub const path = "/racing";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        selections: model.Presence([]const RacingSelectionName) = .absent,
        id: model.Presence(union(enum) {
            v0: RaceId,
            v1: RaceTrackId,
        }) = .absent,
        limit: model.Presence(i64) = .absent,
        sort: model.Presence(enum {
            DESC,
            ASC,
        }) = .absent,
        to: model.Presence(i64) = .absent,
        from: model.Presence(i64) = .absent,
        cat: model.Presence(union(enum) {
            v0: RacingRaceTypeEnum,
            v1: RaceClassEnum,
        }) = .absent,
        offset: model.Presence(i64) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = struct {
        races: model.Presence([]const Race) = .absent,
        _metadata: model.Presence(RequestMetadataWithLinks) = .absent,
        records: model.Presence([]const RaceRecord) = .absent,
        race: model.Presence(RacingRaceDetails) = .absent,
        cars: model.Presence([]const RaceCar) = .absent,
        tracks: model.Presence([]const RaceTrack) = .absent,
        carupgrades: model.Presence([]const RaceCarUpgrade) = .absent,
        selections: model.Presence([]const RacingSelectionName) = .absent,
        timestamp: model.Presence(i64) = .absent,
        pub const json_schema = "{\"type\":\"object\",\"properties\":{\"races\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/Race\"}},\"_metadata\":{\"$ref\":\"#/components/schemas/RequestMetadataWithLinks\"},\"records\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/RaceRecord\"}},\"race\":{\"$ref\":\"#/components/schemas/RacingRaceDetails\"},\"cars\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/RaceCar\"}},\"tracks\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/RaceTrack\"}},\"carupgrades\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/RaceCarUpgrade\"}},\"selections\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/RacingSelectionName\"}},\"timestamp\":{\"type\":\"integer\",\"format\":\"int32\"}}}";
    };
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Racing\"],\"summary\":\"Get any Racing selection\",\"description\":\"Requires public access key. <br>Choose one or more selections (comma separated).\",\"operationId\":\"getRacingGeneric\",\"parameters\":[{\"name\":\"selections\",\"in\":\"query\",\"description\":\"Selection names\",\"required\":false,\"style\":\"form\",\"explode\":false,\"schema\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/RacingSelectionName\"}}},{\"name\":\"id\",\"in\":\"query\",\"description\":\"selection id\",\"required\":false,\"schema\":{\"oneOf\":[{\"$ref\":\"#/components/schemas/RaceId\"},{\"$ref\":\"#/components/schemas/RaceTrackId\"}]}},{\"$ref\":\"#/components/parameters/ApiLimit\"},{\"$ref\":\"#/components/parameters/ApiSort\"},{\"$ref\":\"#/components/parameters/ApiTo\"},{\"$ref\":\"#/components/parameters/ApiFrom\"},{\"name\":\"cat\",\"in\":\"query\",\"description\":\"Selection category\",\"required\":false,\"schema\":{\"oneOf\":[{\"$ref\":\"#/components/schemas/RacingRaceTypeEnum\"},{\"$ref\":\"#/components/schemas/RaceClassEnum\"}]}},{\"$ref\":\"#/components/parameters/ApiOffsetNoDefault\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"anyOf\":[{\"$ref\":\"#/components/schemas/RacingRacesResponse\"},{\"$ref\":\"#/components/schemas/RacingTrackRecordsResponse\"},{\"$ref\":\"#/components/schemas/RacingRaceDetailsResponse\"},{\"$ref\":\"#/components/schemas/RacingCarsResponse\"},{\"$ref\":\"#/components/schemas/RacingTracksResponse\"},{\"$ref\":\"#/components/schemas/RacingCarUpgradesResponse\"},{\"$ref\":\"#/components/schemas/RacingLookupResponse\"},{\"$ref\":\"#/components/schemas/TimestampResponse\"}]}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getProperty = struct {
    pub const operation_id = "getProperty";
    pub const path = "/property/{id}/property";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        id: PropertyId,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = PropertyPropertyResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Property\"],\"summary\":\"Get a specific property\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getProperty\",\"parameters\":[{\"name\":\"id\",\"in\":\"path\",\"description\":\"Property id\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/PropertyId\"}},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/PropertyPropertyResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getPropertyLookup = struct {
    pub const operation_id = "getPropertyLookup";
    pub const path = "/property/lookup";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = PropertyLookupResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Property\"],\"summary\":\"Get all available property selections\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getPropertyLookup\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/PropertyLookupResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getPropertyTimestamp = struct {
    pub const operation_id = "getPropertyTimestamp";
    pub const path = "/property/timestamp";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = TimestampResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Property\"],\"summary\":\"Get current server time\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getPropertyTimestamp\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/TimestampResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getPropertyGeneric = struct {
    pub const operation_id = "getPropertyGeneric";
    pub const path = "/property";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        selections: model.Presence([]const PropertySelectionName) = .absent,
        id: PropertyId,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = struct {
        property: model.Presence(UserPropertyDetails) = .absent,
        selections: model.Presence([]const PropertySelectionName) = .absent,
        timestamp: model.Presence(i64) = .absent,
        pub const json_schema = "{\"type\":\"object\",\"properties\":{\"property\":{\"$ref\":\"#/components/schemas/UserPropertyDetails\"},\"selections\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/PropertySelectionName\"}},\"timestamp\":{\"type\":\"integer\",\"format\":\"int32\"}}}";
    };
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Property\"],\"summary\":\"Get any property selection\",\"description\":\"Requires public access key. <br>Choose one or more selections (comma separated).\",\"operationId\":\"getPropertyGeneric\",\"parameters\":[{\"name\":\"selections\",\"in\":\"query\",\"description\":\"Selection names\",\"required\":false,\"style\":\"form\",\"explode\":false,\"schema\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/PropertySelectionName\"}}},{\"name\":\"id\",\"in\":\"query\",\"description\":\"Property id\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/PropertyId\"}},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"anyOf\":[{\"$ref\":\"#/components/schemas/UserPropertyResponse\"},{\"$ref\":\"#/components/schemas/PropertyLookupResponse\"},{\"$ref\":\"#/components/schemas/TimestampResponse\"}]}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getTornAttackLog = struct {
    pub const operation_id = "getTornAttackLog";
    pub const path = "/torn/attacklog";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        log: AttackCode,
        offset: model.Presence(i64) = .absent,
        sort: model.Presence(enum {
            DESC,
            ASC,
        }) = .absent,
        striptags: model.Presence(enum {
            true,
            false,
        }) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = AttackLogResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Torn\"],\"summary\":\"Get attack log details\",\"description\":\"Requires public key. <br>\",\"operationId\":\"getTornAttackLog\",\"parameters\":[{\"name\":\"log\",\"in\":\"query\",\"description\":\"Code of the attack log. E.g. d51ad4fe6be884b309b142e2d1d4f807\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/AttackCode\"}},{\"$ref\":\"#/components/parameters/ApiOffset\"},{\"$ref\":\"#/components/parameters/ApiSort\"},{\"$ref\":\"#/components/parameters/ApiStripTagsTrue\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/AttackLogResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getTornBank = struct {
    pub const operation_id = "getTornBank";
    pub const path = "/torn/bank";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = TornBankResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Torn\"],\"summary\":\"Get current bank rates\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getTornBank\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/TornBankResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getTornBounties = struct {
    pub const operation_id = "getTornBounties";
    pub const path = "/torn/bounties";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        limit: model.Presence(i64) = .absent,
        offset: model.Presence(i64) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = TornBountiesResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Torn\"],\"summary\":\"Get bounties\",\"description\":\"<b>Globally cached selection.</b><br><br>Requires public key. <br>\",\"operationId\":\"getTornBounties\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiLimit100\"},{\"$ref\":\"#/components/parameters/ApiOffset\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/TornBountiesResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getTornCalendar = struct {
    pub const operation_id = "getTornCalendar";
    pub const path = "/torn/calendar";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = TornCalendarResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Torn\"],\"summary\":\"Get calendar information\",\"description\":\"Requires public access key. <br> Get the details about competitions & events in the running year.\",\"operationId\":\"getTornCalendar\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Success\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/TornCalendarResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getTornCards = struct {
    pub const operation_id = "getTornCards";
    pub const path = "/torn/cards";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = TornCardsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Torn\"],\"summary\":\"Get casino playing cards\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getTornCards\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/TornCardsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getTornCityShops = struct {
    pub const operation_id = "getTornCityShops";
    pub const path = "/torn/cityshops";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = TornCityShopsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Torn\"],\"summary\":\"Get city shops stock information\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getTornCityShops\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/TornCityShopsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getTornCityShopSpecific = struct {
    pub const operation_id = "getTornCityShopSpecific";
    pub const path = "/torn/{shopId}/cityshops";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        shopId: CityShopId,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = TornCityShopsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Torn\"],\"summary\":\"Get stock information for a specific shop\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getTornCityShopSpecific\",\"parameters\":[{\"name\":\"shopId\",\"in\":\"path\",\"description\":\"Shop id\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/CityShopId\"}},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/TornCityShopsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getTornCompanies = struct {
    pub const operation_id = "getTornCompanies";
    pub const path = "/torn/companies";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = TornCompaniesResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Torn\"],\"summary\":\"Get all companies details\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getTornCompanies\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/TornCompaniesResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getTornCompaniesSpecific = struct {
    pub const operation_id = "getTornCompaniesSpecific";
    pub const path = "/torn/{typeId}/companies";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        typeId: CompanyTypeId,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = TornCompaniesResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Torn\"],\"summary\":\"Get specific company details\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getTornCompaniesSpecific\",\"parameters\":[{\"name\":\"typeId\",\"in\":\"path\",\"description\":\"Company type id\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/CompanyTypeId\"}},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/TornCompaniesResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getTornCrimes = struct {
    pub const operation_id = "getTornCrimes";
    pub const path = "/torn/crimes";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = TornCrimesResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Torn\"],\"summary\":\"Get crimes information\",\"description\":\"Requires public access key. <br> Return the details about released crimes.\",\"operationId\":\"getTornCrimes\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/TornCrimesResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getTornEducation = struct {
    pub const operation_id = "getTornEducation";
    pub const path = "/torn/education";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = TornEducationResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Torn\"],\"summary\":\"Get education information\",\"description\":\"Requires public access key.<br>\",\"operationId\":\"getTornEducation\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/TornEducationResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getTornElimination = struct {
    pub const operation_id = "getTornElimination";
    pub const path = "/torn/elimination";
    pub const stability = "Unstable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = TornEliminationTeamsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Torn\"],\"summary\":\"Get current standings for all elimination teams\",\"description\":\"Requires public key.\",\"operationId\":\"getTornElimination\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/TornEliminationTeamsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Unstable\"}";
};
pub const getTornEliminationTeam = struct {
    pub const operation_id = "getTornEliminationTeam";
    pub const path = "/torn/{id}/eliminationteam";
    pub const stability = "Unstable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        id: EliminationTeamId,
        limit: model.Presence(i64) = .absent,
        offset: model.Presence(i64) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = TornEliminationTeamPlayersResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Torn\"],\"summary\":\"Get players in a specific elimination team\",\"description\":\"Requires public key.\",\"operationId\":\"getTornEliminationTeam\",\"parameters\":[{\"name\":\"id\",\"in\":\"path\",\"description\":\"Elimination team id\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/EliminationTeamId\"}},{\"$ref\":\"#/components/parameters/ApiLimit100\"},{\"$ref\":\"#/components/parameters/ApiOffsetNoDefault\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/TornEliminationTeamPlayersResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Unstable\"}";
};
pub const getTornFactionHoF = struct {
    pub const operation_id = "getTornFactionHoF";
    pub const path = "/torn/factionhof";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        limit: model.Presence(i64) = .absent,
        offset: model.Presence(i64) = .absent,
        cat: TornFactionHofCategory,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = TornFactionHofResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Torn\"],\"summary\":\"Get faction hall of fame positions for a specific category\",\"description\":\"Requires public access key. <br> \",\"operationId\":\"getTornFactionHoF\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiLimit100\"},{\"$ref\":\"#/components/parameters/ApiOffset\"},{\"name\":\"cat\",\"in\":\"query\",\"description\":\"Leaderboards category\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/TornFactionHofCategory\"}},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/TornFactionHofResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getTornFactionTree = struct {
    pub const operation_id = "getTornFactionTree";
    pub const path = "/torn/factiontree";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = TornFactionTreeResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Torn\"],\"summary\":\"Get full faction tree\",\"description\":\"Requires public access key. <br> \",\"operationId\":\"getTornFactionTree\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/TornFactionTreeResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getTornGyms = struct {
    pub const operation_id = "getTornGyms";
    pub const path = "/torn/gyms";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = TornGymsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Torn\"],\"summary\":\"Get all gyms\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getTornGyms\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/TornGymsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getTornHalloween = struct {
    pub const operation_id = "getTornHalloween";
    pub const path = "/torn/halloween";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = TornHalloweenResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Torn\"],\"summary\":\"Get Halloween basket upgrades\",\"description\":\"Requires minimal access key. <br>Returns the list of available Halloween basket upgrades with their benefits, treats cost and unlock requirement.\",\"operationId\":\"getTornHalloween\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyMinimal\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/TornHalloweenResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getTornHonors = struct {
    pub const operation_id = "getTornHonors";
    pub const path = "/torn/honors";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        limit: model.Presence(i64) = .absent,
        offset: model.Presence(i64) = .absent,
        sort: model.Presence(enum {
            DESC,
            ASC,
        }) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = TornHonorsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Torn\"],\"summary\":\"Get all honors\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getTornHonors\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiLimitDefault20\"},{\"$ref\":\"#/components/parameters/ApiOffset\"},{\"$ref\":\"#/components/parameters/ApiSort\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/TornHonorsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getTornHonorsSpecific = struct {
    pub const operation_id = "getTornHonorsSpecific";
    pub const path = "/torn/{ids}/honors";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        ids: []const HonorId,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = TornHonorsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Torn\"],\"summary\":\"Get specific honors\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getTornHonorsSpecific\",\"parameters\":[{\"name\":\"ids\",\"in\":\"path\",\"description\":\"Honor id or a list of honor ids (comma separated)\",\"required\":true,\"style\":\"form\",\"explode\":false,\"schema\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/HonorId\"}}},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/TornHonorsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getTornHoF = struct {
    pub const operation_id = "getTornHoF";
    pub const path = "/torn/hof";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        limit: model.Presence(i64) = .absent,
        offset: model.Presence(i64) = .absent,
        cat: TornHofCategory,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = TornHofResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Torn\"],\"summary\":\"Get player hall of fame positions for a specific category\",\"description\":\"Requires public key.\",\"operationId\":\"getTornHoF\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiLimit100\"},{\"$ref\":\"#/components/parameters/ApiOffset\"},{\"name\":\"cat\",\"in\":\"query\",\"description\":\"Leaderboards category\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/TornHofCategory\"}},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/TornHofResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getTornItemAmmo = struct {
    pub const operation_id = "getTornItemAmmo";
    pub const path = "/torn/itemammo";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = TornItemAmmoResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Torn\"],\"summary\":\"Get information about ammo\",\"description\":\"Requires public key.\",\"operationId\":\"getTornItemAmmo\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/TornItemAmmoResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getTornItemDetails = struct {
    pub const operation_id = "getTornItemDetails";
    pub const path = "/torn/{ids}/itemdetails";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        ids: []const ItemUid,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = TornItemDetailsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Torn\"],\"summary\":\"Get details for specific item(s)\",\"description\":\"Requires public key.\",\"operationId\":\"getTornItemDetails\",\"parameters\":[{\"name\":\"ids\",\"in\":\"path\",\"description\":\"Item uid or a list of item uids (comma separated), 25 uids maximum\",\"required\":true,\"style\":\"form\",\"explode\":false,\"schema\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/ItemUid\"}}},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/TornItemDetailsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getTornItemMods = struct {
    pub const operation_id = "getTornItemMods";
    pub const path = "/torn/itemmods";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = TornItemModsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Torn\"],\"summary\":\"Get information about weapon upgrades\",\"description\":\"Requires public key.\",\"operationId\":\"getTornItemMods\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/TornItemModsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getTornItemStats = struct {
    pub const operation_id = "getTornItemStats";
    pub const path = "/torn/{ids}/itemstats";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        ids: []const ItemUid,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = TornItemStatsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Torn\"],\"summary\":\"Get specific item(s) stats\",\"description\":\"Requires public key.<br>\",\"operationId\":\"getTornItemStats\",\"parameters\":[{\"name\":\"ids\",\"in\":\"path\",\"description\":\"Item uid or a list of item uids (comma separated), 25 uids maximum\",\"required\":true,\"style\":\"form\",\"explode\":false,\"schema\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/ItemUid\"}}},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/TornItemStatsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getTornItems = struct {
    pub const operation_id = "getTornItems";
    pub const path = "/torn/items";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        cat: model.Presence(TornItemCategory) = .absent,
        sort: model.Presence(enum {
            DESC,
            ASC,
        }) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = TornItemsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Torn\"],\"summary\":\"Get information about items\",\"description\":\"Requires public key.<br>Default category is 'All'.<br>Details are not populated when requesting the category 'All'.\",\"operationId\":\"getTornItems\",\"parameters\":[{\"name\":\"cat\",\"in\":\"query\",\"description\":\"Item category type\",\"required\":false,\"schema\":{\"$ref\":\"#/components/schemas/TornItemCategory\"}},{\"$ref\":\"#/components/parameters/ApiSortAsc\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/TornItemsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getTornItemsSpecific = struct {
    pub const operation_id = "getTornItemsSpecific";
    pub const path = "/torn/{ids}/items";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        ids: []const ItemId,
        sort: model.Presence(enum {
            DESC,
            ASC,
        }) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = TornItemsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Torn\"],\"summary\":\"Get information about items\",\"description\":\"Requires public key.<br>Details are always populated when available.\",\"operationId\":\"getTornItemsSpecific\",\"parameters\":[{\"name\":\"ids\",\"in\":\"path\",\"description\":\"Item id or a list of item ids (comma separated)\",\"required\":true,\"style\":\"form\",\"explode\":false,\"schema\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/ItemId\"}}},{\"$ref\":\"#/components/parameters/ApiSortAsc\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/TornItemsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getTornLogCategories = struct {
    pub const operation_id = "getTornLogCategories";
    pub const path = "/torn/logcategories";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = TornLogCategoriesResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Torn\"],\"summary\":\"Get available log categories\",\"description\":\"Requires public key. <br>\",\"operationId\":\"getTornLogCategories\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/TornLogCategoriesResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getTornLogTypes = struct {
    pub const operation_id = "getTornLogTypes";
    pub const path = "/torn/logtypes";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = TornLogTypesResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Torn\"],\"summary\":\"Get all available log ids\",\"description\":\"Requires public key. <br>\",\"operationId\":\"getTornLogTypes\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/TornLogTypesResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getTornLogTypesSpecific = struct {
    pub const operation_id = "getTornLogTypesSpecific";
    pub const path = "/torn/{logCategoryId}/logtypes";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        logCategoryId: LogCategoryId,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = TornLogTypesResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Torn\"],\"summary\":\"Get available log ids for a specific log category\",\"description\":\"Requires public key. <br>\",\"operationId\":\"getTornLogTypesSpecific\",\"parameters\":[{\"name\":\"logCategoryId\",\"in\":\"path\",\"description\":\"Log category id\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/LogCategoryId\"}},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/TornLogTypesResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getTornMedals = struct {
    pub const operation_id = "getTornMedals";
    pub const path = "/torn/medals";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = TornMedalsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Torn\"],\"summary\":\"Get all medals\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getTornMedals\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/TornMedalsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getTornMedalsSpecific = struct {
    pub const operation_id = "getTornMedalsSpecific";
    pub const path = "/torn/{ids}/medals";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        ids: []const MedalId,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = TornMedalsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Torn\"],\"summary\":\"Get specific medals\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getTornMedalsSpecific\",\"parameters\":[{\"name\":\"ids\",\"in\":\"path\",\"description\":\"Medal id or a list of medal ids (comma separated)\",\"required\":true,\"style\":\"form\",\"explode\":false,\"schema\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/MedalId\"}}},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/TornMedalsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getTornMerits = struct {
    pub const operation_id = "getTornMerits";
    pub const path = "/torn/merits";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = TornMeritsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Torn\"],\"summary\":\"Get all merits\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getTornMerits\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/TornMeritsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getTornMuseum = struct {
    pub const operation_id = "getTornMuseum";
    pub const path = "/torn/museum";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = TornMuseumResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Torn\"],\"summary\":\"Get all museum sets\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getTornMuseum\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/TornMuseumResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getTornOrganizedCrimes = struct {
    pub const operation_id = "getTornOrganizedCrimes";
    pub const path = "/torn/organizedcrimes";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = TornOrganizedCrimeResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Torn\"],\"summary\":\"Get organized crimes information\",\"description\":\"Requires public access key. <br> Return the details about released faction organized crimes.\",\"operationId\":\"getTornOrganizedCrimes\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/TornOrganizedCrimeResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getTornPokerTables = struct {
    pub const operation_id = "getTornPokerTables";
    pub const path = "/torn/pokertables";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = TornPokerTablesResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Torn\"],\"summary\":\"Get active poker tables\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getTornPokerTables\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/TornPokerTablesResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getTornProperties = struct {
    pub const operation_id = "getTornProperties";
    pub const path = "/torn/properties";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = TornProperties;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Torn\"],\"summary\":\"Get properties details\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getTornProperties\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/TornProperties\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getTornRps = struct {
    pub const operation_id = "getTornRps";
    pub const path = "/torn/rockpaperscissors";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = TornRockPaperScissorsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Torn\"],\"summary\":\"Get rock paper scissors competition stats\",\"description\":\"Requires public key.\",\"operationId\":\"getTornRps\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/TornRockPaperScissorsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getTornSearchForCash = struct {
    pub const operation_id = "getTornSearchForCash";
    pub const path = "/torn/searchforcash";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = TornSearchForCashResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Torn\"],\"summary\":\"Get search for cash crime statuses\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getTornSearchForCash\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/TornSearchForCashResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getTornShoplifting = struct {
    pub const operation_id = "getTornShoplifting";
    pub const path = "/torn/shoplifting";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = TornShopliftingResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Torn\"],\"summary\":\"Get shoplifting crime statuses\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getTornShoplifting\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/TornShopliftingResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getTornCityStats = struct {
    pub const operation_id = "getTornCityStats";
    pub const path = "/torn/stats";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = TornCityStatsResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Torn\"],\"summary\":\"Get daily city stats\",\"description\":\"Requires public key.\",\"operationId\":\"getTornCityStats\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/TornCityStatsResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getTornStocks = struct {
    pub const operation_id = "getTornStocks";
    pub const path = "/torn/stocks";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = TornStocksResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Torn\"],\"summary\":\"Get all stocks\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getTornStocks\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/TornStocksResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getSpecificTornStock = struct {
    pub const operation_id = "getSpecificTornStock";
    pub const path = "/torn/{stockId}/stocks";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        stockId: StockId,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = TornStockDetailedResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Torn\"],\"summary\":\"Get specific stock with chart history\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getSpecificTornStock\",\"parameters\":[{\"name\":\"stockId\",\"in\":\"path\",\"description\":\"Stock id\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/StockId\"}},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/TornStockDetailedResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getTornSubcrimes = struct {
    pub const operation_id = "getTornSubcrimes";
    pub const path = "/torn/{crimeId}/subcrimes";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        crimeId: TornCrimeId,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = TornSubcrimesResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Torn\"],\"summary\":\"Get Subcrimes information\",\"description\":\"Requires public access key. <br> Return the details about possible actions for a specific crime.\",\"operationId\":\"getTornSubcrimes\",\"parameters\":[{\"name\":\"crimeId\",\"in\":\"path\",\"description\":\"Crime id\",\"required\":true,\"schema\":{\"$ref\":\"#/components/schemas/TornCrimeId\"}},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/TornSubcrimesResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getTornTerritory = struct {
    pub const operation_id = "getTornTerritory";
    pub const path = "/torn/territory";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        ids: model.Presence([]const FactionTerritoryEnum) = .absent,
        offset: model.Presence(i64) = .absent,
        limit: model.Presence(i64) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = TornTerritoriesResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Torn\"],\"summary\":\"Get territory details\",\"description\":\"Requires public access key. <br>\",\"operationId\":\"getTornTerritory\",\"parameters\":[{\"name\":\"ids\",\"in\":\"query\",\"description\":\"Specific territory id or a list of territory ids (comma separated)\",\"required\":false,\"style\":\"form\",\"explode\":false,\"schema\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/FactionTerritoryEnum\"}}},{\"$ref\":\"#/components/parameters/ApiOffset\"},{\"$ref\":\"#/components/parameters/ApiLimit250Default20\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/TornTerritoriesResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getTornLookup = struct {
    pub const operation_id = "getTornLookup";
    pub const path = "/torn/lookup";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = TornLookupResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Torn\"],\"summary\":\"Get all available torn selections\",\"description\":\"Requires public key. <br>\",\"operationId\":\"getTornLookup\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/TornLookupResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getTornTimestamp = struct {
    pub const operation_id = "getTornTimestamp";
    pub const path = "/torn/timestamp";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = TimestampResponse;
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Torn\"],\"summary\":\"Get current server time\",\"description\":\"Requires public key. <br>\",\"operationId\":\"getTornTimestamp\",\"parameters\":[{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"$ref\":\"#/components/schemas/TimestampResponse\"}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const getTornGeneric = struct {
    pub const operation_id = "getTornGeneric";
    pub const path = "/torn";
    pub const stability = "Stable";
    pub const upstream_cache_ttl_seconds: ?u32 = null;
    pub const method = "GET";
    pub const Params = @This().Parameters;
    pub const Parameters = struct {
        selections: model.Presence([]const TornSelectionName) = .absent,
        id: model.Presence(union(enum) {
            v0: LogCategoryId,
            v1: TornCrimeId,
            v2: StockId,
            v3: EliminationTeamId,
            v4: CityShopId,
            v5: ItemUid,
            v6: []const ItemId,
            v7: []const MedalId,
            v8: []const HonorId,
            v9: []const FactionTerritoryEnum,
        }) = .absent,
        legacy: model.Presence([]const TornSelectionName) = .absent,
        striptags: model.Presence(enum {
            true,
            false,
        }) = .absent,
        limit: model.Presence(i64) = .absent,
        to: model.Presence(i64) = .absent,
        from: model.Presence(i64) = .absent,
        sort: model.Presence(enum {
            DESC,
            ASC,
        }) = .absent,
        cat: model.Presence(union(enum) {
            v0: TornFactionHofCategory,
            v1: TornHofCategory,
            v2: TornItemCategory,
        }) = .absent,
        offset: model.Presence(i64) = .absent,
        timestamp: model.Presence(union(enum) {
            v0: i64,
            v1: []const u8,
        }) = .absent,
        comment: model.Presence([]const u8) = .absent,
        key: model.Presence([]const u8) = .absent,
    };
    pub const Response = struct {
        subcrimes: model.Presence([]const TornSubcrime) = .absent,
        crimes: model.Presence([]const TornCrime) = .absent,
        calendar: model.Presence(struct {
            competitions: []const TornCalendarActivity,
            events: []const TornCalendarActivity,
            pub const json_schema = "{\"required\":[\"competitions\",\"events\"],\"properties\":{\"competitions\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/TornCalendarActivity\"}},\"events\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/TornCalendarActivity\"}}},\"type\":\"object\"}";
        }) = .absent,
        hof: model.Presence([]const TornHof) = .absent,
        _metadata: model.Presence(union(enum) {
            v0: RequestMetadataWithLinks,
            v1: RequestMetadataWithLinksAndTotal,
        }) = .absent,
        factionhof: model.Presence([]const TornFactionHof) = .absent,
        logtypes: model.Presence([]const TornLog) = .absent,
        cards: model.Presence([]const TornCard) = .absent,
        items: model.Presence([]const TornItem) = .absent,
        rockpaperscissors: model.Presence([]const struct {
            type: enum {
                rock,
                paper,
                scissors,
            },
            count: i64,
            pub const json_schema = "{\"required\":[\"type\",\"count\"],\"properties\":{\"type\":{\"type\":\"string\",\"enum\":[\"rock\",\"paper\",\"scissors\"]},\"count\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}";
        }) = .absent,
        stats: model.Presence(struct {
            users: struct {
                total: i64,
                male: i64,
                female: i64,
                enby: i64,
                married: i64,
                pub const json_schema = "{\"required\":[\"total\",\"male\",\"female\",\"enby\",\"married\"],\"properties\":{\"total\":{\"type\":\"integer\",\"format\":\"int64\"},\"male\":{\"type\":\"integer\",\"format\":\"int64\"},\"female\":{\"type\":\"integer\",\"format\":\"int64\"},\"enby\":{\"type\":\"integer\",\"format\":\"int64\"},\"married\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}";
            },
            items: struct {
                found_in_city: i64,
                found_in_dump: i64,
                trashed: i64,
                total: i64,
                pub const json_schema = "{\"required\":[\"found_in_city\",\"found_in_dump\",\"trashed\",\"total\"],\"properties\":{\"found_in_city\":{\"type\":\"integer\",\"format\":\"int64\"},\"found_in_dump\":{\"type\":\"integer\",\"format\":\"int64\"},\"trashed\":{\"type\":\"integer\",\"format\":\"int64\"},\"total\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}";
            },
            trading: struct {
                sold_on_market: i64,
                sold_in_bazaar: i64,
                sold_points: i64,
                bazaar_profit: i64,
                auctions: i64,
                trades: i64,
                items_sent: i64,
                pub const json_schema = "{\"required\":[\"sold_on_market\",\"sold_in_bazaar\",\"sold_points\",\"bazaar_profit\",\"auctions\",\"trades\",\"items_sent\"],\"properties\":{\"sold_on_market\":{\"type\":\"integer\",\"format\":\"int64\"},\"sold_in_bazaar\":{\"type\":\"integer\",\"format\":\"int64\"},\"sold_points\":{\"type\":\"integer\",\"format\":\"int64\"},\"bazaar_profit\":{\"type\":\"integer\",\"format\":\"int64\"},\"auctions\":{\"type\":\"integer\",\"format\":\"int64\"},\"trades\":{\"type\":\"integer\",\"format\":\"int64\"},\"items_sent\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}";
            },
            currency: struct {
                money_on_hand: i64,
                money_on_hand_average: i64,
                money_in_bank: i64,
                points_total: i64,
                points_players: i64,
                points_factions: i64,
                points_market: i64,
                points_used: i64,
                points_bought: i64,
                points_average_cost: i64,
                pub const json_schema = "{\"required\":[\"points_bought\",\"points_average_cost\",\"money_on_hand\",\"money_on_hand_average\",\"money_in_bank\",\"points_total\",\"points_players\",\"points_factions\",\"points_market\",\"points_used\"],\"properties\":{\"money_on_hand\":{\"type\":\"integer\",\"format\":\"int64\"},\"money_on_hand_average\":{\"type\":\"integer\",\"format\":\"int64\"},\"money_in_bank\":{\"type\":\"integer\",\"format\":\"int64\"},\"points_total\":{\"type\":\"integer\",\"format\":\"int64\"},\"points_players\":{\"type\":\"integer\",\"format\":\"int64\"},\"points_factions\":{\"type\":\"integer\",\"format\":\"int64\"},\"points_market\":{\"type\":\"integer\",\"format\":\"int64\"},\"points_used\":{\"type\":\"integer\",\"format\":\"int64\"},\"points_bought\":{\"type\":\"integer\",\"format\":\"int64\"},\"points_average_cost\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}";
            },
            attacking: struct {
                attacks_won: i64,
                attacks_lost: i64,
                attacks_stalemated: i64,
                attacks_stealthed: i64,
                escapes: i64,
                hits: i64,
                misses: i64,
                critical_hits: i64,
                rounds_fired: i64,
                money_mugged: i64,
                respect_gained: i64,
                wars_ranked: i64,
                wars_territory: i64,
                wars_raid: i64,
                pub const json_schema = "{\"required\":[\"wars_ranked\",\"wars_territory\",\"wars_raid\",\"attacks_won\",\"attacks_lost\",\"attacks_stalemated\",\"attacks_stealthed\",\"escapes\",\"hits\",\"misses\",\"critical_hits\",\"rounds_fired\",\"money_mugged\",\"respect_gained\"],\"properties\":{\"attacks_won\":{\"type\":\"integer\",\"format\":\"int64\"},\"attacks_lost\":{\"type\":\"integer\",\"format\":\"int64\"},\"attacks_stalemated\":{\"type\":\"integer\",\"format\":\"int64\"},\"attacks_stealthed\":{\"type\":\"integer\",\"format\":\"int64\"},\"escapes\":{\"type\":\"integer\",\"format\":\"int64\"},\"hits\":{\"type\":\"integer\",\"format\":\"int64\"},\"misses\":{\"type\":\"integer\",\"format\":\"int64\"},\"critical_hits\":{\"type\":\"integer\",\"format\":\"int64\"},\"rounds_fired\":{\"type\":\"integer\",\"format\":\"int64\"},\"money_mugged\":{\"type\":\"integer\",\"format\":\"int64\"},\"respect_gained\":{\"type\":\"integer\",\"format\":\"int64\"},\"wars_ranked\":{\"type\":\"integer\",\"format\":\"int64\"},\"wars_territory\":{\"type\":\"integer\",\"format\":\"int64\"},\"wars_raid\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}";
            },
            jobs: struct {
                army: i64,
                grocer: i64,
                casino: i64,
                education: i64,
                medical: i64,
                law: i64,
                company: i64,
                unemployed: i64,
                pub const json_schema = "{\"required\":[\"army\",\"grocer\",\"casino\",\"education\",\"medical\",\"law\",\"company\",\"unemployed\"],\"properties\":{\"army\":{\"type\":\"integer\",\"format\":\"int64\"},\"grocer\":{\"type\":\"integer\",\"format\":\"int64\"},\"casino\":{\"type\":\"integer\",\"format\":\"int64\"},\"education\":{\"type\":\"integer\",\"format\":\"int64\"},\"medical\":{\"type\":\"integer\",\"format\":\"int64\"},\"law\":{\"type\":\"integer\",\"format\":\"int64\"},\"company\":{\"type\":\"integer\",\"format\":\"int64\"},\"unemployed\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}";
            },
            jail: struct {
                jailings: i64,
                busts: i64,
                busts_failed: i64,
                bails: i64,
                bails_spent: i64,
                pub const json_schema = "{\"required\":[\"jailings\",\"busts\",\"busts_failed\",\"bails\",\"bails_spent\"],\"properties\":{\"jailings\":{\"type\":\"integer\",\"format\":\"int64\"},\"busts\":{\"type\":\"integer\",\"format\":\"int64\"},\"busts_failed\":{\"type\":\"integer\",\"format\":\"int64\"},\"bails\":{\"type\":\"integer\",\"format\":\"int64\"},\"bails_spent\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}";
            },
            hospital: struct {
                trips: i64,
                medical_items_used: i64,
                revives: i64,
                pub const json_schema = "{\"required\":[\"trips\",\"medical_items_used\",\"revives\"],\"properties\":{\"trips\":{\"type\":\"integer\",\"format\":\"int64\"},\"medical_items_used\":{\"type\":\"integer\",\"format\":\"int64\"},\"revives\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}";
            },
            drugs: struct {
                total_used: i64,
                overdoses: i64,
                cannabis: i64,
                ecstasy: i64,
                ketamine: i64,
                lsd: i64,
                opium: i64,
                shrooms: i64,
                speed: i64,
                pcp: i64,
                xanax: i64,
                vicodin: i64,
                pub const json_schema = "{\"required\":[\"total_used\",\"overdoses\",\"cannabis\",\"ecstasy\",\"ketamine\",\"lsd\",\"opium\",\"shrooms\",\"speed\",\"pcp\",\"xanax\",\"vicodin\"],\"properties\":{\"total_used\":{\"type\":\"integer\",\"format\":\"int64\"},\"overdoses\":{\"type\":\"integer\",\"format\":\"int64\"},\"cannabis\":{\"type\":\"integer\",\"format\":\"int64\"},\"ecstasy\":{\"type\":\"integer\",\"format\":\"int64\"},\"ketamine\":{\"type\":\"integer\",\"format\":\"int64\"},\"lsd\":{\"type\":\"integer\",\"format\":\"int64\"},\"opium\":{\"type\":\"integer\",\"format\":\"int64\"},\"shrooms\":{\"type\":\"integer\",\"format\":\"int64\"},\"speed\":{\"type\":\"integer\",\"format\":\"int64\"},\"pcp\":{\"type\":\"integer\",\"format\":\"int64\"},\"xanax\":{\"type\":\"integer\",\"format\":\"int64\"},\"vicodin\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}";
            },
            traveling: struct {
                items_bought_abroad: i64,
                total_trips: i64,
                argentina: i64,
                mexico: i64,
                united_arab_emirates: i64,
                hawaii: i64,
                japan: i64,
                united_kingdom: i64,
                south_africa: i64,
                switzerland: i64,
                china: i64,
                cayman_islands: i64,
                canada: i64,
                pub const json_schema = "{\"required\":[\"canada\",\"items_bought_abroad\",\"total_trips\",\"argentina\",\"mexico\",\"united_arab_emirates\",\"hawaii\",\"japan\",\"united_kingdom\",\"south_africa\",\"switzerland\",\"china\",\"cayman_islands\"],\"properties\":{\"items_bought_abroad\":{\"type\":\"integer\",\"format\":\"int64\"},\"total_trips\":{\"type\":\"integer\",\"format\":\"int64\"},\"argentina\":{\"type\":\"integer\",\"format\":\"int64\"},\"mexico\":{\"type\":\"integer\",\"format\":\"int64\"},\"united_arab_emirates\":{\"type\":\"integer\",\"format\":\"int64\"},\"hawaii\":{\"type\":\"integer\",\"format\":\"int64\"},\"japan\":{\"type\":\"integer\",\"format\":\"int64\"},\"united_kingdom\":{\"type\":\"integer\",\"format\":\"int64\"},\"south_africa\":{\"type\":\"integer\",\"format\":\"int64\"},\"switzerland\":{\"type\":\"integer\",\"format\":\"int64\"},\"china\":{\"type\":\"integer\",\"format\":\"int64\"},\"cayman_islands\":{\"type\":\"integer\",\"format\":\"int64\"},\"canada\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}";
            },
            bounties: struct {
                placed: i64,
                money_spent: i64,
                pub const json_schema = "{\"required\":[\"placed\",\"money_spent\"],\"properties\":{\"placed\":{\"type\":\"integer\",\"format\":\"int64\"},\"money_spent\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}";
            },
            crimes: struct {
                total: i64,
                today: i64,
                jail_sentences: i64,
                pub const json_schema = "{\"required\":[\"total\",\"today\",\"jail_sentences\"],\"properties\":{\"total\":{\"type\":\"integer\",\"format\":\"int64\"},\"today\":{\"type\":\"integer\",\"format\":\"int64\"},\"jail_sentences\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}";
            },
            communication: struct {
                messages: i64,
                total_messages: i64,
                friends: model.Presence(i64) = .absent,
                mails_friends: i64,
                coworkers: model.Presence(i64) = .absent,
                mails_coworkers: i64,
                spouses: model.Presence(i64) = .absent,
                mails_spouses: i64,
                mails_faction: i64,
                mails_total: i64,
                chats: i64,
                articles: i64,
                article_views: i64,
                article_reads: i64,
                classified_ads_placed: i64,
                personals_placed: i64,
                events: i64,
                total_events: i64,
                forum_posts: i64,
                forum_threads: i64,
                forum_likes: i64,
                forum_dislikes: i64,
                pub const json_schema = "{\"required\":[\"messages\",\"mails_friends\",\"mails_coworkers\",\"mails_spouses\",\"mails_faction\",\"mails_total\",\"chats\",\"articles\",\"article_views\",\"article_reads\",\"events\",\"total_events\",\"forum_posts\",\"forum_threads\",\"forum_likes\",\"forum_dislikes\",\"total_messages\",\"classified_ads_placed\",\"personals_placed\"],\"properties\":{\"messages\":{\"type\":\"integer\",\"format\":\"int64\"},\"total_messages\":{\"type\":\"integer\",\"format\":\"int64\"},\"friends\":{\"description\":\"Replaced with 'mails_friends' field. Will be removed on 1st of January 2027.\",\"type\":\"integer\",\"format\":\"int64\",\"deprecated\":true},\"mails_friends\":{\"type\":\"integer\",\"format\":\"int64\"},\"coworkers\":{\"description\":\"Replaced with 'mails_coworkers' field. Will be removed on 1st of January 2027.\",\"type\":\"integer\",\"format\":\"int64\",\"deprecated\":true},\"mails_coworkers\":{\"type\":\"integer\",\"format\":\"int64\"},\"spouses\":{\"description\":\"Replaced with 'mails_spouses' field. Will be removed on 1st of January 2027.\",\"type\":\"integer\",\"format\":\"int64\",\"deprecated\":true},\"mails_spouses\":{\"type\":\"integer\",\"format\":\"int64\"},\"mails_faction\":{\"type\":\"integer\",\"format\":\"int64\"},\"mails_total\":{\"type\":\"integer\",\"format\":\"int64\"},\"chats\":{\"type\":\"integer\",\"format\":\"int64\"},\"articles\":{\"type\":\"integer\",\"format\":\"int64\"},\"article_views\":{\"type\":\"integer\",\"format\":\"int64\"},\"article_reads\":{\"type\":\"integer\",\"format\":\"int64\"},\"classified_ads_placed\":{\"type\":\"integer\",\"format\":\"int64\"},\"personals_placed\":{\"type\":\"integer\",\"format\":\"int64\"},\"events\":{\"type\":\"integer\",\"format\":\"int64\"},\"total_events\":{\"type\":\"integer\",\"format\":\"int64\"},\"forum_posts\":{\"type\":\"integer\",\"format\":\"int64\"},\"forum_threads\":{\"type\":\"integer\",\"format\":\"int64\"},\"forum_likes\":{\"type\":\"integer\",\"format\":\"int64\"},\"forum_dislikes\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}";
            },
            other: struct {
                logins: i64,
                years_played: i64,
                merits_bought: i64,
                energy_refills: i64,
                company_trains: i64,
                stat_enhancers_used: i64,
                gym_trains: i64,
                users_daily: i64,
                pub const json_schema = "{\"required\":[\"users_daily\",\"gym_trains\",\"logins\",\"years_played\",\"merits_bought\",\"energy_refills\",\"company_trains\",\"stat_enhancers_used\"],\"properties\":{\"logins\":{\"type\":\"integer\",\"format\":\"int64\"},\"years_played\":{\"type\":\"integer\",\"format\":\"int64\"},\"merits_bought\":{\"type\":\"integer\",\"format\":\"int64\"},\"energy_refills\":{\"type\":\"integer\",\"format\":\"int64\"},\"company_trains\":{\"type\":\"integer\",\"format\":\"int64\"},\"stat_enhancers_used\":{\"type\":\"integer\",\"format\":\"int64\"},\"gym_trains\":{\"type\":\"integer\",\"format\":\"int64\"},\"users_daily\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}";
            },
            pub const json_schema = "{\"required\":[\"users\",\"items\",\"trading\",\"currency\",\"attacking\",\"jobs\",\"jail\",\"hospital\",\"drugs\",\"traveling\",\"bounties\",\"crimes\",\"communication\",\"other\"],\"properties\":{\"users\":{\"required\":[\"total\",\"male\",\"female\",\"enby\",\"married\"],\"properties\":{\"total\":{\"type\":\"integer\",\"format\":\"int64\"},\"male\":{\"type\":\"integer\",\"format\":\"int64\"},\"female\":{\"type\":\"integer\",\"format\":\"int64\"},\"enby\":{\"type\":\"integer\",\"format\":\"int64\"},\"married\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"},\"items\":{\"required\":[\"found_in_city\",\"found_in_dump\",\"trashed\",\"total\"],\"properties\":{\"found_in_city\":{\"type\":\"integer\",\"format\":\"int64\"},\"found_in_dump\":{\"type\":\"integer\",\"format\":\"int64\"},\"trashed\":{\"type\":\"integer\",\"format\":\"int64\"},\"total\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"},\"trading\":{\"required\":[\"sold_on_market\",\"sold_in_bazaar\",\"sold_points\",\"bazaar_profit\",\"auctions\",\"trades\",\"items_sent\"],\"properties\":{\"sold_on_market\":{\"type\":\"integer\",\"format\":\"int64\"},\"sold_in_bazaar\":{\"type\":\"integer\",\"format\":\"int64\"},\"sold_points\":{\"type\":\"integer\",\"format\":\"int64\"},\"bazaar_profit\":{\"type\":\"integer\",\"format\":\"int64\"},\"auctions\":{\"type\":\"integer\",\"format\":\"int64\"},\"trades\":{\"type\":\"integer\",\"format\":\"int64\"},\"items_sent\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"},\"currency\":{\"required\":[\"points_bought\",\"points_average_cost\",\"money_on_hand\",\"money_on_hand_average\",\"money_in_bank\",\"points_total\",\"points_players\",\"points_factions\",\"points_market\",\"points_used\"],\"properties\":{\"money_on_hand\":{\"type\":\"integer\",\"format\":\"int64\"},\"money_on_hand_average\":{\"type\":\"integer\",\"format\":\"int64\"},\"money_in_bank\":{\"type\":\"integer\",\"format\":\"int64\"},\"points_total\":{\"type\":\"integer\",\"format\":\"int64\"},\"points_players\":{\"type\":\"integer\",\"format\":\"int64\"},\"points_factions\":{\"type\":\"integer\",\"format\":\"int64\"},\"points_market\":{\"type\":\"integer\",\"format\":\"int64\"},\"points_used\":{\"type\":\"integer\",\"format\":\"int64\"},\"points_bought\":{\"type\":\"integer\",\"format\":\"int64\"},\"points_average_cost\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"},\"attacking\":{\"required\":[\"wars_ranked\",\"wars_territory\",\"wars_raid\",\"attacks_won\",\"attacks_lost\",\"attacks_stalemated\",\"attacks_stealthed\",\"escapes\",\"hits\",\"misses\",\"critical_hits\",\"rounds_fired\",\"money_mugged\",\"respect_gained\"],\"properties\":{\"attacks_won\":{\"type\":\"integer\",\"format\":\"int64\"},\"attacks_lost\":{\"type\":\"integer\",\"format\":\"int64\"},\"attacks_stalemated\":{\"type\":\"integer\",\"format\":\"int64\"},\"attacks_stealthed\":{\"type\":\"integer\",\"format\":\"int64\"},\"escapes\":{\"type\":\"integer\",\"format\":\"int64\"},\"hits\":{\"type\":\"integer\",\"format\":\"int64\"},\"misses\":{\"type\":\"integer\",\"format\":\"int64\"},\"critical_hits\":{\"type\":\"integer\",\"format\":\"int64\"},\"rounds_fired\":{\"type\":\"integer\",\"format\":\"int64\"},\"money_mugged\":{\"type\":\"integer\",\"format\":\"int64\"},\"respect_gained\":{\"type\":\"integer\",\"format\":\"int64\"},\"wars_ranked\":{\"type\":\"integer\",\"format\":\"int64\"},\"wars_territory\":{\"type\":\"integer\",\"format\":\"int64\"},\"wars_raid\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"},\"jobs\":{\"required\":[\"army\",\"grocer\",\"casino\",\"education\",\"medical\",\"law\",\"company\",\"unemployed\"],\"properties\":{\"army\":{\"type\":\"integer\",\"format\":\"int64\"},\"grocer\":{\"type\":\"integer\",\"format\":\"int64\"},\"casino\":{\"type\":\"integer\",\"format\":\"int64\"},\"education\":{\"type\":\"integer\",\"format\":\"int64\"},\"medical\":{\"type\":\"integer\",\"format\":\"int64\"},\"law\":{\"type\":\"integer\",\"format\":\"int64\"},\"company\":{\"type\":\"integer\",\"format\":\"int64\"},\"unemployed\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"},\"jail\":{\"required\":[\"jailings\",\"busts\",\"busts_failed\",\"bails\",\"bails_spent\"],\"properties\":{\"jailings\":{\"type\":\"integer\",\"format\":\"int64\"},\"busts\":{\"type\":\"integer\",\"format\":\"int64\"},\"busts_failed\":{\"type\":\"integer\",\"format\":\"int64\"},\"bails\":{\"type\":\"integer\",\"format\":\"int64\"},\"bails_spent\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"},\"hospital\":{\"required\":[\"trips\",\"medical_items_used\",\"revives\"],\"properties\":{\"trips\":{\"type\":\"integer\",\"format\":\"int64\"},\"medical_items_used\":{\"type\":\"integer\",\"format\":\"int64\"},\"revives\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"},\"drugs\":{\"required\":[\"total_used\",\"overdoses\",\"cannabis\",\"ecstasy\",\"ketamine\",\"lsd\",\"opium\",\"shrooms\",\"speed\",\"pcp\",\"xanax\",\"vicodin\"],\"properties\":{\"total_used\":{\"type\":\"integer\",\"format\":\"int64\"},\"overdoses\":{\"type\":\"integer\",\"format\":\"int64\"},\"cannabis\":{\"type\":\"integer\",\"format\":\"int64\"},\"ecstasy\":{\"type\":\"integer\",\"format\":\"int64\"},\"ketamine\":{\"type\":\"integer\",\"format\":\"int64\"},\"lsd\":{\"type\":\"integer\",\"format\":\"int64\"},\"opium\":{\"type\":\"integer\",\"format\":\"int64\"},\"shrooms\":{\"type\":\"integer\",\"format\":\"int64\"},\"speed\":{\"type\":\"integer\",\"format\":\"int64\"},\"pcp\":{\"type\":\"integer\",\"format\":\"int64\"},\"xanax\":{\"type\":\"integer\",\"format\":\"int64\"},\"vicodin\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"},\"traveling\":{\"required\":[\"canada\",\"items_bought_abroad\",\"total_trips\",\"argentina\",\"mexico\",\"united_arab_emirates\",\"hawaii\",\"japan\",\"united_kingdom\",\"south_africa\",\"switzerland\",\"china\",\"cayman_islands\"],\"properties\":{\"items_bought_abroad\":{\"type\":\"integer\",\"format\":\"int64\"},\"total_trips\":{\"type\":\"integer\",\"format\":\"int64\"},\"argentina\":{\"type\":\"integer\",\"format\":\"int64\"},\"mexico\":{\"type\":\"integer\",\"format\":\"int64\"},\"united_arab_emirates\":{\"type\":\"integer\",\"format\":\"int64\"},\"hawaii\":{\"type\":\"integer\",\"format\":\"int64\"},\"japan\":{\"type\":\"integer\",\"format\":\"int64\"},\"united_kingdom\":{\"type\":\"integer\",\"format\":\"int64\"},\"south_africa\":{\"type\":\"integer\",\"format\":\"int64\"},\"switzerland\":{\"type\":\"integer\",\"format\":\"int64\"},\"china\":{\"type\":\"integer\",\"format\":\"int64\"},\"cayman_islands\":{\"type\":\"integer\",\"format\":\"int64\"},\"canada\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"},\"bounties\":{\"required\":[\"placed\",\"money_spent\"],\"properties\":{\"placed\":{\"type\":\"integer\",\"format\":\"int64\"},\"money_spent\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"},\"crimes\":{\"required\":[\"total\",\"today\",\"jail_sentences\"],\"properties\":{\"total\":{\"type\":\"integer\",\"format\":\"int64\"},\"today\":{\"type\":\"integer\",\"format\":\"int64\"},\"jail_sentences\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"},\"communication\":{\"required\":[\"messages\",\"mails_friends\",\"mails_coworkers\",\"mails_spouses\",\"mails_faction\",\"mails_total\",\"chats\",\"articles\",\"article_views\",\"article_reads\",\"events\",\"total_events\",\"forum_posts\",\"forum_threads\",\"forum_likes\",\"forum_dislikes\",\"total_messages\",\"classified_ads_placed\",\"personals_placed\"],\"properties\":{\"messages\":{\"type\":\"integer\",\"format\":\"int64\"},\"total_messages\":{\"type\":\"integer\",\"format\":\"int64\"},\"friends\":{\"description\":\"Replaced with 'mails_friends' field. Will be removed on 1st of January 2027.\",\"type\":\"integer\",\"format\":\"int64\",\"deprecated\":true},\"mails_friends\":{\"type\":\"integer\",\"format\":\"int64\"},\"coworkers\":{\"description\":\"Replaced with 'mails_coworkers' field. Will be removed on 1st of January 2027.\",\"type\":\"integer\",\"format\":\"int64\",\"deprecated\":true},\"mails_coworkers\":{\"type\":\"integer\",\"format\":\"int64\"},\"spouses\":{\"description\":\"Replaced with 'mails_spouses' field. Will be removed on 1st of January 2027.\",\"type\":\"integer\",\"format\":\"int64\",\"deprecated\":true},\"mails_spouses\":{\"type\":\"integer\",\"format\":\"int64\"},\"mails_faction\":{\"type\":\"integer\",\"format\":\"int64\"},\"mails_total\":{\"type\":\"integer\",\"format\":\"int64\"},\"chats\":{\"type\":\"integer\",\"format\":\"int64\"},\"articles\":{\"type\":\"integer\",\"format\":\"int64\"},\"article_views\":{\"type\":\"integer\",\"format\":\"int64\"},\"article_reads\":{\"type\":\"integer\",\"format\":\"int64\"},\"classified_ads_placed\":{\"type\":\"integer\",\"format\":\"int64\"},\"personals_placed\":{\"type\":\"integer\",\"format\":\"int64\"},\"events\":{\"type\":\"integer\",\"format\":\"int64\"},\"total_events\":{\"type\":\"integer\",\"format\":\"int64\"},\"forum_posts\":{\"type\":\"integer\",\"format\":\"int64\"},\"forum_threads\":{\"type\":\"integer\",\"format\":\"int64\"},\"forum_likes\":{\"type\":\"integer\",\"format\":\"int64\"},\"forum_dislikes\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"},\"other\":{\"required\":[\"users_daily\",\"gym_trains\",\"logins\",\"years_played\",\"merits_bought\",\"energy_refills\",\"company_trains\",\"stat_enhancers_used\"],\"properties\":{\"logins\":{\"type\":\"integer\",\"format\":\"int64\"},\"years_played\":{\"type\":\"integer\",\"format\":\"int64\"},\"merits_bought\":{\"type\":\"integer\",\"format\":\"int64\"},\"energy_refills\":{\"type\":\"integer\",\"format\":\"int64\"},\"company_trains\":{\"type\":\"integer\",\"format\":\"int64\"},\"stat_enhancers_used\":{\"type\":\"integer\",\"format\":\"int64\"},\"gym_trains\":{\"type\":\"integer\",\"format\":\"int64\"},\"users_daily\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}},\"type\":\"object\"}";
        }) = .absent,
        logcategories: model.Presence([]const TornLogCategory) = .absent,
        education: model.Presence([]const TornEducation) = .absent,
        merits: model.Presence([]const TornMerit) = .absent,
        organizedcrimes: model.Presence([]const TornOrganizedCrime) = .absent,
        itemdetails: model.Presence(union(enum) {
            v0: []const TornItemStats,
            v1: union(enum) {
                v0: []const TornItemDetails,
                v1: TornItemDetailsDeprecated,
            },
        }) = .absent,
        honors: model.Presence([]const TornHonor) = .absent,
        elimination: model.Presence([]const TornEliminationTeam) = .absent,
        cityshops: model.Presence([]const TornCityShop) = .absent,
        eliminationteam: model.Presence([]const TornEliminationTeamPlayer) = .absent,
        medals: model.Presence([]const TornMedal) = .absent,
        bank: model.Presence([]const TornBank) = .absent,
        halloween: model.Presence(TornHalloween) = .absent,
        bounties: model.Presence([]const Bounty) = .absent,
        bounties_timestamp: model.Presence(i64) = .absent,
        bounties_delay: model.Presence(i64) = .absent,
        gyms: model.Presence([]const TornGym) = .absent,
        pokertables: model.Presence([]const TornPokerTable) = .absent,
        itemammo: model.Presence([]const TornItemAmmo) = .absent,
        properties: model.Presence([]const struct {
            id: PropertyTypeId,
            name: []const u8,
            cost: i64,
            happy: i64,
            upkeep: i64,
            modifications: []const PropertyModificationEnum,
            staff: []const PropertyStaffEnum,
            pub const json_schema = "{\"required\":[\"id\",\"name\",\"cost\",\"happy\",\"upkeep\",\"modifications\",\"staff\"],\"properties\":{\"id\":{\"$ref\":\"#/components/schemas/PropertyTypeId\"},\"name\":{\"type\":\"string\"},\"cost\":{\"type\":\"integer\",\"format\":\"int32\"},\"happy\":{\"type\":\"integer\",\"format\":\"int32\"},\"upkeep\":{\"type\":\"integer\",\"format\":\"int32\"},\"modifications\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/PropertyModificationEnum\"}},\"staff\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/PropertyStaffEnum\"}}},\"type\":\"object\"}";
        }) = .absent,
        factionTree: model.Presence([]const TornFactionTree) = .absent,
        attacklog: model.Presence(struct {
            log: []const AttackLog,
            summary: []const AttackLogSummary,
            pub const json_schema = "{\"required\":[\"log\",\"summary\"],\"properties\":{\"log\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/AttackLog\"}},\"summary\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/AttackLogSummary\"}}},\"type\":\"object\"}";
        }) = .absent,
        museum: model.Presence([]const TornMuseumSet) = .absent,
        stocks: model.Presence(union(enum) {
            v0: TornStockDetailed,
            v1: []const TornStock,
        }) = .absent,
        territory: model.Presence([]const TornTerritory) = .absent,
        itemmods: model.Presence([]const TornItemMods) = .absent,
        selections: model.Presence([]const TornSelectionName) = .absent,
        timestamp: model.Presence(i64) = .absent,
        pub const json_schema = "{\"type\":\"object\",\"properties\":{\"subcrimes\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/TornSubcrime\"}},\"crimes\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/TornCrime\"}},\"calendar\":{\"required\":[\"competitions\",\"events\"],\"properties\":{\"competitions\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/TornCalendarActivity\"}},\"events\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/TornCalendarActivity\"}}},\"type\":\"object\"},\"hof\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/TornHof\"}},\"_metadata\":{\"anyOf\":[{\"$ref\":\"#/components/schemas/RequestMetadataWithLinks\"},{\"$ref\":\"#/components/schemas/RequestMetadataWithLinksAndTotal\"}]},\"factionhof\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/TornFactionHof\"}},\"logtypes\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/TornLog\"}},\"cards\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/TornCard\"}},\"items\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/TornItem\"}},\"rockpaperscissors\":{\"type\":\"array\",\"items\":{\"required\":[\"type\",\"count\"],\"properties\":{\"type\":{\"type\":\"string\",\"enum\":[\"rock\",\"paper\",\"scissors\"]},\"count\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}},\"stats\":{\"required\":[\"users\",\"items\",\"trading\",\"currency\",\"attacking\",\"jobs\",\"jail\",\"hospital\",\"drugs\",\"traveling\",\"bounties\",\"crimes\",\"communication\",\"other\"],\"properties\":{\"users\":{\"required\":[\"total\",\"male\",\"female\",\"enby\",\"married\"],\"properties\":{\"total\":{\"type\":\"integer\",\"format\":\"int64\"},\"male\":{\"type\":\"integer\",\"format\":\"int64\"},\"female\":{\"type\":\"integer\",\"format\":\"int64\"},\"enby\":{\"type\":\"integer\",\"format\":\"int64\"},\"married\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"},\"items\":{\"required\":[\"found_in_city\",\"found_in_dump\",\"trashed\",\"total\"],\"properties\":{\"found_in_city\":{\"type\":\"integer\",\"format\":\"int64\"},\"found_in_dump\":{\"type\":\"integer\",\"format\":\"int64\"},\"trashed\":{\"type\":\"integer\",\"format\":\"int64\"},\"total\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"},\"trading\":{\"required\":[\"sold_on_market\",\"sold_in_bazaar\",\"sold_points\",\"bazaar_profit\",\"auctions\",\"trades\",\"items_sent\"],\"properties\":{\"sold_on_market\":{\"type\":\"integer\",\"format\":\"int64\"},\"sold_in_bazaar\":{\"type\":\"integer\",\"format\":\"int64\"},\"sold_points\":{\"type\":\"integer\",\"format\":\"int64\"},\"bazaar_profit\":{\"type\":\"integer\",\"format\":\"int64\"},\"auctions\":{\"type\":\"integer\",\"format\":\"int64\"},\"trades\":{\"type\":\"integer\",\"format\":\"int64\"},\"items_sent\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"},\"currency\":{\"required\":[\"points_bought\",\"points_average_cost\",\"money_on_hand\",\"money_on_hand_average\",\"money_in_bank\",\"points_total\",\"points_players\",\"points_factions\",\"points_market\",\"points_used\"],\"properties\":{\"money_on_hand\":{\"type\":\"integer\",\"format\":\"int64\"},\"money_on_hand_average\":{\"type\":\"integer\",\"format\":\"int64\"},\"money_in_bank\":{\"type\":\"integer\",\"format\":\"int64\"},\"points_total\":{\"type\":\"integer\",\"format\":\"int64\"},\"points_players\":{\"type\":\"integer\",\"format\":\"int64\"},\"points_factions\":{\"type\":\"integer\",\"format\":\"int64\"},\"points_market\":{\"type\":\"integer\",\"format\":\"int64\"},\"points_used\":{\"type\":\"integer\",\"format\":\"int64\"},\"points_bought\":{\"type\":\"integer\",\"format\":\"int64\"},\"points_average_cost\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"},\"attacking\":{\"required\":[\"wars_ranked\",\"wars_territory\",\"wars_raid\",\"attacks_won\",\"attacks_lost\",\"attacks_stalemated\",\"attacks_stealthed\",\"escapes\",\"hits\",\"misses\",\"critical_hits\",\"rounds_fired\",\"money_mugged\",\"respect_gained\"],\"properties\":{\"attacks_won\":{\"type\":\"integer\",\"format\":\"int64\"},\"attacks_lost\":{\"type\":\"integer\",\"format\":\"int64\"},\"attacks_stalemated\":{\"type\":\"integer\",\"format\":\"int64\"},\"attacks_stealthed\":{\"type\":\"integer\",\"format\":\"int64\"},\"escapes\":{\"type\":\"integer\",\"format\":\"int64\"},\"hits\":{\"type\":\"integer\",\"format\":\"int64\"},\"misses\":{\"type\":\"integer\",\"format\":\"int64\"},\"critical_hits\":{\"type\":\"integer\",\"format\":\"int64\"},\"rounds_fired\":{\"type\":\"integer\",\"format\":\"int64\"},\"money_mugged\":{\"type\":\"integer\",\"format\":\"int64\"},\"respect_gained\":{\"type\":\"integer\",\"format\":\"int64\"},\"wars_ranked\":{\"type\":\"integer\",\"format\":\"int64\"},\"wars_territory\":{\"type\":\"integer\",\"format\":\"int64\"},\"wars_raid\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"},\"jobs\":{\"required\":[\"army\",\"grocer\",\"casino\",\"education\",\"medical\",\"law\",\"company\",\"unemployed\"],\"properties\":{\"army\":{\"type\":\"integer\",\"format\":\"int64\"},\"grocer\":{\"type\":\"integer\",\"format\":\"int64\"},\"casino\":{\"type\":\"integer\",\"format\":\"int64\"},\"education\":{\"type\":\"integer\",\"format\":\"int64\"},\"medical\":{\"type\":\"integer\",\"format\":\"int64\"},\"law\":{\"type\":\"integer\",\"format\":\"int64\"},\"company\":{\"type\":\"integer\",\"format\":\"int64\"},\"unemployed\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"},\"jail\":{\"required\":[\"jailings\",\"busts\",\"busts_failed\",\"bails\",\"bails_spent\"],\"properties\":{\"jailings\":{\"type\":\"integer\",\"format\":\"int64\"},\"busts\":{\"type\":\"integer\",\"format\":\"int64\"},\"busts_failed\":{\"type\":\"integer\",\"format\":\"int64\"},\"bails\":{\"type\":\"integer\",\"format\":\"int64\"},\"bails_spent\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"},\"hospital\":{\"required\":[\"trips\",\"medical_items_used\",\"revives\"],\"properties\":{\"trips\":{\"type\":\"integer\",\"format\":\"int64\"},\"medical_items_used\":{\"type\":\"integer\",\"format\":\"int64\"},\"revives\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"},\"drugs\":{\"required\":[\"total_used\",\"overdoses\",\"cannabis\",\"ecstasy\",\"ketamine\",\"lsd\",\"opium\",\"shrooms\",\"speed\",\"pcp\",\"xanax\",\"vicodin\"],\"properties\":{\"total_used\":{\"type\":\"integer\",\"format\":\"int64\"},\"overdoses\":{\"type\":\"integer\",\"format\":\"int64\"},\"cannabis\":{\"type\":\"integer\",\"format\":\"int64\"},\"ecstasy\":{\"type\":\"integer\",\"format\":\"int64\"},\"ketamine\":{\"type\":\"integer\",\"format\":\"int64\"},\"lsd\":{\"type\":\"integer\",\"format\":\"int64\"},\"opium\":{\"type\":\"integer\",\"format\":\"int64\"},\"shrooms\":{\"type\":\"integer\",\"format\":\"int64\"},\"speed\":{\"type\":\"integer\",\"format\":\"int64\"},\"pcp\":{\"type\":\"integer\",\"format\":\"int64\"},\"xanax\":{\"type\":\"integer\",\"format\":\"int64\"},\"vicodin\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"},\"traveling\":{\"required\":[\"canada\",\"items_bought_abroad\",\"total_trips\",\"argentina\",\"mexico\",\"united_arab_emirates\",\"hawaii\",\"japan\",\"united_kingdom\",\"south_africa\",\"switzerland\",\"china\",\"cayman_islands\"],\"properties\":{\"items_bought_abroad\":{\"type\":\"integer\",\"format\":\"int64\"},\"total_trips\":{\"type\":\"integer\",\"format\":\"int64\"},\"argentina\":{\"type\":\"integer\",\"format\":\"int64\"},\"mexico\":{\"type\":\"integer\",\"format\":\"int64\"},\"united_arab_emirates\":{\"type\":\"integer\",\"format\":\"int64\"},\"hawaii\":{\"type\":\"integer\",\"format\":\"int64\"},\"japan\":{\"type\":\"integer\",\"format\":\"int64\"},\"united_kingdom\":{\"type\":\"integer\",\"format\":\"int64\"},\"south_africa\":{\"type\":\"integer\",\"format\":\"int64\"},\"switzerland\":{\"type\":\"integer\",\"format\":\"int64\"},\"china\":{\"type\":\"integer\",\"format\":\"int64\"},\"cayman_islands\":{\"type\":\"integer\",\"format\":\"int64\"},\"canada\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"},\"bounties\":{\"required\":[\"placed\",\"money_spent\"],\"properties\":{\"placed\":{\"type\":\"integer\",\"format\":\"int64\"},\"money_spent\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"},\"crimes\":{\"required\":[\"total\",\"today\",\"jail_sentences\"],\"properties\":{\"total\":{\"type\":\"integer\",\"format\":\"int64\"},\"today\":{\"type\":\"integer\",\"format\":\"int64\"},\"jail_sentences\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"},\"communication\":{\"required\":[\"messages\",\"mails_friends\",\"mails_coworkers\",\"mails_spouses\",\"mails_faction\",\"mails_total\",\"chats\",\"articles\",\"article_views\",\"article_reads\",\"events\",\"total_events\",\"forum_posts\",\"forum_threads\",\"forum_likes\",\"forum_dislikes\",\"total_messages\",\"classified_ads_placed\",\"personals_placed\"],\"properties\":{\"messages\":{\"type\":\"integer\",\"format\":\"int64\"},\"total_messages\":{\"type\":\"integer\",\"format\":\"int64\"},\"friends\":{\"description\":\"Replaced with 'mails_friends' field. Will be removed on 1st of January 2027.\",\"type\":\"integer\",\"format\":\"int64\",\"deprecated\":true},\"mails_friends\":{\"type\":\"integer\",\"format\":\"int64\"},\"coworkers\":{\"description\":\"Replaced with 'mails_coworkers' field. Will be removed on 1st of January 2027.\",\"type\":\"integer\",\"format\":\"int64\",\"deprecated\":true},\"mails_coworkers\":{\"type\":\"integer\",\"format\":\"int64\"},\"spouses\":{\"description\":\"Replaced with 'mails_spouses' field. Will be removed on 1st of January 2027.\",\"type\":\"integer\",\"format\":\"int64\",\"deprecated\":true},\"mails_spouses\":{\"type\":\"integer\",\"format\":\"int64\"},\"mails_faction\":{\"type\":\"integer\",\"format\":\"int64\"},\"mails_total\":{\"type\":\"integer\",\"format\":\"int64\"},\"chats\":{\"type\":\"integer\",\"format\":\"int64\"},\"articles\":{\"type\":\"integer\",\"format\":\"int64\"},\"article_views\":{\"type\":\"integer\",\"format\":\"int64\"},\"article_reads\":{\"type\":\"integer\",\"format\":\"int64\"},\"classified_ads_placed\":{\"type\":\"integer\",\"format\":\"int64\"},\"personals_placed\":{\"type\":\"integer\",\"format\":\"int64\"},\"events\":{\"type\":\"integer\",\"format\":\"int64\"},\"total_events\":{\"type\":\"integer\",\"format\":\"int64\"},\"forum_posts\":{\"type\":\"integer\",\"format\":\"int64\"},\"forum_threads\":{\"type\":\"integer\",\"format\":\"int64\"},\"forum_likes\":{\"type\":\"integer\",\"format\":\"int64\"},\"forum_dislikes\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"},\"other\":{\"required\":[\"users_daily\",\"gym_trains\",\"logins\",\"years_played\",\"merits_bought\",\"energy_refills\",\"company_trains\",\"stat_enhancers_used\"],\"properties\":{\"logins\":{\"type\":\"integer\",\"format\":\"int64\"},\"years_played\":{\"type\":\"integer\",\"format\":\"int64\"},\"merits_bought\":{\"type\":\"integer\",\"format\":\"int64\"},\"energy_refills\":{\"type\":\"integer\",\"format\":\"int64\"},\"company_trains\":{\"type\":\"integer\",\"format\":\"int64\"},\"stat_enhancers_used\":{\"type\":\"integer\",\"format\":\"int64\"},\"gym_trains\":{\"type\":\"integer\",\"format\":\"int64\"},\"users_daily\":{\"type\":\"integer\",\"format\":\"int64\"}},\"type\":\"object\"}},\"type\":\"object\"},\"logcategories\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/TornLogCategory\"}},\"education\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/TornEducation\"}},\"merits\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/TornMerit\"}},\"organizedcrimes\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/TornOrganizedCrime\"}},\"itemdetails\":{\"anyOf\":[{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/TornItemStats\"}},{\"description\":\"Starting 1st January 2027, this response will return only an array of TornItemDetails.\",\"oneOf\":[{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/TornItemDetails\"}},{\"$ref\":\"#/components/schemas/TornItemDetailsDeprecated\",\"description\":\"This object is deprecated, and starting on 1st January 2027 it will be replaced with an array of TornItemDetails.\"}]}]},\"honors\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/TornHonor\"}},\"elimination\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/TornEliminationTeam\"}},\"cityshops\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/TornCityShop\"}},\"eliminationteam\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/TornEliminationTeamPlayer\"}},\"medals\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/TornMedal\"}},\"bank\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/TornBank\"}},\"halloween\":{\"$ref\":\"#/components/schemas/TornHalloween\"},\"bounties\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/Bounty\"}},\"bounties_timestamp\":{\"type\":\"integer\",\"format\":\"int32\"},\"bounties_delay\":{\"description\":\"The minimum amount of time needed before the cache timestamp can change.\",\"type\":\"integer\",\"format\":\"int32\"},\"gyms\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/TornGym\"}},\"pokertables\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/TornPokerTable\"}},\"itemammo\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/TornItemAmmo\"}},\"properties\":{\"type\":\"array\",\"items\":{\"required\":[\"id\",\"name\",\"cost\",\"happy\",\"upkeep\",\"modifications\",\"staff\"],\"properties\":{\"id\":{\"$ref\":\"#/components/schemas/PropertyTypeId\"},\"name\":{\"type\":\"string\"},\"cost\":{\"type\":\"integer\",\"format\":\"int32\"},\"happy\":{\"type\":\"integer\",\"format\":\"int32\"},\"upkeep\":{\"type\":\"integer\",\"format\":\"int32\"},\"modifications\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/PropertyModificationEnum\"}},\"staff\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/PropertyStaffEnum\"}}},\"type\":\"object\"}},\"factionTree\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/TornFactionTree\"}},\"attacklog\":{\"required\":[\"log\",\"summary\"],\"properties\":{\"log\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/AttackLog\"}},\"summary\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/AttackLogSummary\"}}},\"type\":\"object\"},\"museum\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/TornMuseumSet\"}},\"stocks\":{\"anyOf\":[{\"$ref\":\"#/components/schemas/TornStockDetailed\"},{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/TornStock\"}}]},\"territory\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/TornTerritory\"}},\"itemmods\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/TornItemMods\"}},\"selections\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/TornSelectionName\"}},\"timestamp\":{\"type\":\"integer\",\"format\":\"int32\"}}}";
    };
    pub const media_type = "application/json";
    pub const contract_json = "{\"tags\":[\"Torn\"],\"summary\":\"Get any Torn selection\",\"description\":\"Requires public access key. <br> Choose one or more selections (comma separated).\",\"operationId\":\"getTornGeneric\",\"parameters\":[{\"name\":\"selections\",\"in\":\"query\",\"description\":\"Selection names\",\"required\":false,\"style\":\"form\",\"explode\":false,\"schema\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/TornSelectionName\"}}},{\"name\":\"id\",\"in\":\"query\",\"description\":\"selection id\",\"required\":false,\"schema\":{\"oneOf\":[{\"$ref\":\"#/components/schemas/LogCategoryId\"},{\"$ref\":\"#/components/schemas/TornCrimeId\"},{\"$ref\":\"#/components/schemas/StockId\"},{\"$ref\":\"#/components/schemas/EliminationTeamId\"},{\"$ref\":\"#/components/schemas/CityShopId\"},{\"$ref\":\"#/components/schemas/ItemUid\"},{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/ItemId\"}},{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/MedalId\"}},{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/HonorId\"}},{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/FactionTerritoryEnum\"}}]}},{\"name\":\"legacy\",\"in\":\"query\",\"description\":\"Legacy selection names for which you want or expect API v1 response\",\"required\":false,\"style\":\"form\",\"explode\":false,\"schema\":{\"type\":\"array\",\"items\":{\"$ref\":\"#/components/schemas/TornSelectionName\"}}},{\"$ref\":\"#/components/parameters/ApiStripTags\"},{\"$ref\":\"#/components/parameters/ApiLimit\"},{\"$ref\":\"#/components/parameters/ApiTo\"},{\"$ref\":\"#/components/parameters/ApiFrom\"},{\"$ref\":\"#/components/parameters/ApiSort\"},{\"name\":\"cat\",\"in\":\"query\",\"description\":\"Selection category\",\"required\":false,\"schema\":{\"oneOf\":[{\"$ref\":\"#/components/schemas/TornFactionHofCategory\"},{\"$ref\":\"#/components/schemas/TornHofCategory\"},{\"$ref\":\"#/components/schemas/TornItemCategory\"}]}},{\"$ref\":\"#/components/parameters/ApiOffsetNoDefault\"},{\"$ref\":\"#/components/parameters/ApiTimestamp\"},{\"$ref\":\"#/components/parameters/ApiComment\"},{\"$ref\":\"#/components/parameters/ApiKeyPublic\"}],\"responses\":{\"200\":{\"description\":\"Successful operation\",\"content\":{\"application/json\":{\"schema\":{\"anyOf\":[{\"$ref\":\"#/components/schemas/TornSubcrimesResponse\"},{\"$ref\":\"#/components/schemas/TornCrimesResponse\"},{\"$ref\":\"#/components/schemas/TornCalendarResponse\"},{\"$ref\":\"#/components/schemas/TornHofResponse\"},{\"$ref\":\"#/components/schemas/TornFactionHofResponse\"},{\"$ref\":\"#/components/schemas/TornLogTypesResponse\"},{\"$ref\":\"#/components/schemas/TornCardsResponse\"},{\"$ref\":\"#/components/schemas/TornItemsResponse\"},{\"$ref\":\"#/components/schemas/TornRockPaperScissorsResponse\"},{\"$ref\":\"#/components/schemas/TornCityStatsResponse\"},{\"$ref\":\"#/components/schemas/TornLogCategoriesResponse\"},{\"$ref\":\"#/components/schemas/TornEducationResponse\"},{\"$ref\":\"#/components/schemas/TornMeritsResponse\"},{\"$ref\":\"#/components/schemas/TornOrganizedCrimeResponse\"},{\"$ref\":\"#/components/schemas/TornItemStatsResponse\"},{\"$ref\":\"#/components/schemas/TornHonorsResponse\"},{\"$ref\":\"#/components/schemas/TornItemDetailsResponse\"},{\"$ref\":\"#/components/schemas/TornEliminationTeamsResponse\"},{\"$ref\":\"#/components/schemas/TornCityShopsResponse\"},{\"$ref\":\"#/components/schemas/TornEliminationTeamPlayersResponse\"},{\"$ref\":\"#/components/schemas/TornMedalsResponse\"},{\"$ref\":\"#/components/schemas/TornBankResponse\"},{\"$ref\":\"#/components/schemas/TornHalloweenResponse\"},{\"$ref\":\"#/components/schemas/TornBountiesResponse\"},{\"$ref\":\"#/components/schemas/TornGymsResponse\"},{\"$ref\":\"#/components/schemas/TornPokerTablesResponse\"},{\"$ref\":\"#/components/schemas/TornItemAmmoResponse\"},{\"$ref\":\"#/components/schemas/TornProperties\"},{\"$ref\":\"#/components/schemas/TornFactionTreeResponse\"},{\"$ref\":\"#/components/schemas/AttackLogResponse\"},{\"$ref\":\"#/components/schemas/TornMuseumResponse\"},{\"$ref\":\"#/components/schemas/TornStockDetailedResponse\"},{\"$ref\":\"#/components/schemas/TornStocksResponse\"},{\"$ref\":\"#/components/schemas/TornTerritoriesResponse\"},{\"$ref\":\"#/components/schemas/TornTerritoriesNoLinksResponse\"},{\"$ref\":\"#/components/schemas/TornItemModsResponse\"},{\"$ref\":\"#/components/schemas/TornLookupResponse\"},{\"$ref\":\"#/components/schemas/TimestampResponse\"}]}}}}},\"security\":[{\"api_key\":[]}],\"x-stability\":\"Stable\"}";
};
pub const all_operations = .{
    getMyAmmo,
    getMyAttacks,
    getMyAttacksSimplified,
    getMyBars,
    getMyBasicInformation,
    getUserBasicInformation,
    getMyBattlestats,
    getMyBounties,
    getUserBounties,
    getMyCalendarTime,
    getMyCasinoStreak,
    getMyCompetitionInfo,
    getUserCompetitionInfo,
    getMyCooldowns,
    getMyCrimes,
    getMyDiscord,
    getUserDiscord,
    getMyEducation,
    getMyEnlistedCars,
    getMyEquipment,
    getMyEvents,
    getMyFaction,
    getUserFaction,
    getMyForumFeed,
    getMyForumFriendsUpdates,
    getMyForumPosts,
    getUserForumPosts,
    getMyForumSubscribedThreads,
    getMyForumThreads,
    getUserForumThreads,
    getMyGym,
    getMyHalloween,
    getMyHoF,
    getUserHoF,
    getMyHonors,
    getMyIcons,
    getUserIcons,
    getMyInventory,
    getMyItemMarketListings,
    getMyItemModsInformation,
    getMyJob,
    getUserJob,
    getMyJobPoints,
    getMyJobRanks,
    getMyContactsList,
    getMyLogs,
    getMyMedals,
    getUserMedals,
    getMyMerits,
    getMyMessages,
    getMyMissions,
    getMyMoney,
    getMyNewEvents,
    getMyNetworth,
    getMyNewMessages,
    getMyNotifications,
    getMyOrganizedCrime,
    getMyAvailableOrganizedCrimes,
    getMyPerks,
    getMyPersonalStats,
    getUserPersonalStats,
    getMyProfile,
    getUserProfile,
    getMyProperties,
    getUserProperties,
    getMyProperty,
    getUserProperty,
    getMyRaces,
    getMyRacingRecords,
    getMyRefills,
    getMyReports,
    getMyRevives,
    getMyRevivesSimplified,
    getMySkills,
    getUsersSearch,
    getUsersSnapshot,
    getMyStocks,
    getMyTrades,
    getMyDetailedTrade,
    getMyTravelInformation,
    getMyVirusCodingInformation,
    getMyWeaponExp,
    getMyWorkstats,
    getUserLookup,
    getUserTimestamp,
    getUserGeneric,
    getMyFactionApplications,
    getMyFactionAttacks,
    getMyFactionAttacksSimplified,
    getMyFactionBalance,
    getMyFactionBasicInformation,
    getFactionBasicInformation,
    getMyFactionChain,
    getFactionChain,
    getMyFactionCompletedChains,
    getFactionCompletedChains,
    getMyFactionLatestChainReport,
    getChainReport,
    getMyFactionContributors,
    getMyFactionCrimeExp,
    getMyFactionOrganizedCrimes,
    getMyFactionOrganizedCrime,
    getWarfareDirtyBombs,
    getMyFactionHoF,
    getFactionHoF,
    getMyFactionInventory,
    getMyFactionMembers,
    getFactionMembers,
    getMyFactionNews,
    getMyFactionPositions,
    getFactionRackets,
    getRaidReport,
    getMyFactionRaidsHistory,
    getFactionRaidsHistory,
    getMyFactionRankedWarsHistory,
    getFactionRankedWarsHistory,
    getRankedWarReport,
    getMyFactionReports,
    getMyFactionRevives,
    getMyFactionRevivesSimplified,
    getFactionSearch,
    getFactionsSnapshot,
    getMyFactionStats,
    getMyFactionTerritory,
    getFactionTerritory,
    getTerritoryOwnership,
    getMyFactionTerritoryWarsHistory,
    getFactionTerritoryWarsHistory,
    getTerritoryWarReport,
    getMyFactionUpgrades,
    getWarfareChains,
    getWarfareRaids,
    getWarfareRankedWars,
    getWarfareTerritoryWars,
    getWarfare,
    getMyFactionWars,
    getFactionWars,
    getFactionLookup,
    getFactionTimestamp,
    getFactionGeneric,
    getMyCompanyApplications,
    getMyCompanyEmployees,
    getCompanyEmployees,
    getMyCompanyNews,
    getCompaniesList,
    getMyCompanyProfile,
    getCompanyProfile,
    getCompaniesSearch,
    getCompaniesSnapshot,
    getMyCompanyStock,
    getCompanyLookup,
    getCompanyTimestamp,
    getCompanyGeneric,
    getForumCategories,
    getForumThreadPosts,
    getForumThread,
    getForumAllThreads,
    getForumThreads,
    getForumLookup,
    getForumTimestamp,
    getForumGeneric,
    getKeyLog,
    getKeyInfo,
    getKeyGeneric,
    getMarketAuctionHouseListing,
    getMarketAuctionHouseItem,
    getMarketAuctionHouse,
    getMarketBazaar,
    getMarketBazaarItem,
    getMarketItemMarketItem,
    getMarketProperties,
    getMarketPoints,
    getMarketPropertiesRental,
    getMarketLookup,
    getMarketTimestamp,
    getMarketGeneric,
    getRacingCars,
    getRacingCarUpgrades,
    getRacingRaces,
    getRacingRaceDetails,
    getRacingTrackRecords,
    getRacingTracks,
    getRacingLookup,
    getRacingTimestamp,
    getRacingGeneric,
    getProperty,
    getPropertyLookup,
    getPropertyTimestamp,
    getPropertyGeneric,
    getTornAttackLog,
    getTornBank,
    getTornBounties,
    getTornCalendar,
    getTornCards,
    getTornCityShops,
    getTornCityShopSpecific,
    getTornCompanies,
    getTornCompaniesSpecific,
    getTornCrimes,
    getTornEducation,
    getTornElimination,
    getTornEliminationTeam,
    getTornFactionHoF,
    getTornFactionTree,
    getTornGyms,
    getTornHalloween,
    getTornHonors,
    getTornHonorsSpecific,
    getTornHoF,
    getTornItemAmmo,
    getTornItemDetails,
    getTornItemMods,
    getTornItemStats,
    getTornItems,
    getTornItemsSpecific,
    getTornLogCategories,
    getTornLogTypes,
    getTornLogTypesSpecific,
    getTornMedals,
    getTornMedalsSpecific,
    getTornMerits,
    getTornMuseum,
    getTornOrganizedCrimes,
    getTornPokerTables,
    getTornProperties,
    getTornRps,
    getTornSearchForCash,
    getTornShoplifting,
    getTornCityStats,
    getTornStocks,
    getSpecificTornStock,
    getTornSubcrimes,
    getTornTerritory,
    getTornLookup,
    getTornTimestamp,
    getTornGeneric,
};
pub const operation_count = 236;
