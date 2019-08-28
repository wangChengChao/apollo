package com.ctrip.framework.apollo.biz.repository;

import com.ctrip.framework.apollo.common.entity.App;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

public interface AppRepository extends PagingAndSortingRepository<App, Long> {

  @Query(
      nativeQuery = true,
      value = "SELECT \"Name\" from \"App\"  WHERE \"Name\" LIKE CONCAT(CONCAT('%',?1),'%')")
  List<App> findByName(@Param("name") String name);

  App findByAppId(String appId);
}
