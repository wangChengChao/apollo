package com.ctrip.framework.apollo.biz.repository;

import com.ctrip.framework.apollo.biz.entity.Audit;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

public interface AuditRepository extends PagingAndSortingRepository<Audit, Long> {

  @Query(
      nativeQuery = true,
      value = "SELECT * from \"Audit\"  WHERE \"DataChange_CreatedBy\" = :owner")
  List<Audit> findByOwner(@Param("owner") String owner);

  @Query(
      nativeQuery = true,
      value =
          "SELECT * from \"Audit\"  WHERE \"DataChange_CreatedBy\" = :owner AND \"EntityName\" =:entity AND \"OpName\" = :op")
  List<Audit> findAudits(
      @Param("owner") String owner, @Param("entity") String entity, @Param("op") String op);
}
