package com.ctrip.framework.apollo.portal.repository;

import com.ctrip.framework.apollo.portal.entity.po.Role;
import java.util.List;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

/** @author Jason Song(song_s@ctrip.com) */
public interface RoleRepository extends PagingAndSortingRepository<Role, Long> {

  /** find role by role name */
  Role findTopByRoleName(String roleName);

  @Query(
      nativeQuery = true,
      value =
          "SELECT \"Id\" from \"Role\"  where (\"RoleName\" = CONCAT('Master+', ?1) "
              + "OR \"RoleName\" like CONCAT(CONCAT('ModifyNamespace+', ?1),'+%') "
              + "OR \"RoleName\" like CONCAT(CONCAT('ReleaseNamespace+', ?1), '+%')  "
              + "OR \"RoleName\" = CONCAT('ManageAppMaster+', ?1))")
  List<Long> findRoleIdsByAppId(String appId);

  @Query(
      nativeQuery = true,
      value =
          "SELECT \"Id\" from \"Role\"  where (\"RoleName\" = CONCAT(CONCAT(CONCAT('ModifyNamespace+', ?1), '+'), ?2) "
              + "OR \"RoleName\" = CONCAT(CONCAT(CONCAT('ReleaseNamespace+', ?1), '+'), ?2))")
  List<Long> findRoleIdsByAppIdAndNamespace(String appId, String namespaceName);

  @Modifying
  @Query(
      nativeQuery = true,
      value =
          "UPDATE \"Role\" SET \"IsDeleted\"=1, \"DataChange_LastModifiedBy\" = ?2 WHERE \"Id\" in ?1")
  Integer batchDelete(List<Long> roleIds, String operator);
}
