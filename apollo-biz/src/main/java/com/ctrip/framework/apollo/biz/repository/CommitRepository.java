package com.ctrip.framework.apollo.biz.repository;

import com.ctrip.framework.apollo.biz.entity.Commit;
import java.util.List;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface CommitRepository extends PagingAndSortingRepository<Commit, Long> {

  List<Commit> findByAppIdAndClusterNameAndNamespaceNameOrderByIdDesc(
      String appId, String clusterName, String namespaceName, Pageable pageable);

  @Modifying
  @Query(
      nativeQuery = true,
      value =
          "update \"Commit\" set \"IsDeleted\"=1,\"DataChange_LastModifiedBy\" = ?4 where \"AppId\"=?1 and \"ClusterName\"=?2 and \"NamespaceName\" = ?3")
  int batchDelete(String appId, String clusterName, String namespaceName, String operator);
}
